#!/usr/bin/python
import os
import subprocess
import random
import sys
import argparse
import re

#TODO
# add randomize all interfaces
# add script to desktop config
# fix apt-get update for script
class mac_changer(object):
    """ an an interface to change the mac address of a NIC """

    def __init__(self):
        if os.geteuid() != 0:
            exit("Not running as root, exiting")

    def change_mac(self, interface):
        interface_error = 0
        interface_exists = self.check_interface(interface)

        if interface_exists == 0:
            interface_error = self.randomize_interface(interface)
        else:
            interface_error = 1

        return interface_error

    def check_interface(self, interface):
        """ make sure the interface we are looking for exists """
        command = "ifconfig %s > /dev/null" % interface
        return subprocess.call(command, shell=True)

    def get_rand_mac(self):
        """ generates a list of mac digits in the form
            ['xy', 'zj', 'kq']
        """
        random_mac = []

        # give our random mac a real manufacturer for authenticity :)
        random_mac.append(self.get_rand_manufact())

        # genrate 3 sets of 1 byte mac numbers
        for i in range(0, 3):
            rand_digit1 = self.get_rand_hex_digit()
            rand_digit2 = self.get_rand_hex_digit()
            random_mac.append(rand_digit1 + rand_digit2)

        return ':'.join(random_mac)

    def get_rand_manufact(self):
        manufacts = [
            '00:03:7F',
            '00:00:09',
            '00:40:96',
            '00:30:BD',
            '00:40:DC',
            '00:1B:2F'
        ]

        return manufacts[random.randint(0, len(manufacts) - 1)]

    def get_rand_hex_digit(self):
        return str(hex(random.randint(0, 15)))[2:]

    def randomize_interface(self, interface):
        mac = self.get_rand_mac()
        command = "ifconfig %s hw ether %s" % (interface, mac)

        subprocess.call("ifconfig %s down" % interface, shell=True)
        rc = subprocess.call(command, shell=True)
        subprocess.call("ifconfig %s up" % interface, shell=True)

        return rc

class mac_args(object):
    def __init__(self):
        parser = argparse.ArgumentParser(
                description="Change MAC addr for interfaces")

        parser.add_argument("--all",
                help="Change all non-virtual interface MACs")

        parser.add_argument("--wlan",
                help="Change all non-virtual wlan interfaces")

        parser.add_argument("--lan",
                help="Change all non-virtual lan interfaces")

        parser.add_argument("--reset",
                help="Reset MACs to the hardware bound value")

        args = parser.parse_args()

        print self.get_interfaces()

    def all(self):
        # get all interfaces
        # pipe in ifconfig values
        # filter out virtual interfaces
        pass

    def wlan(self):
        pass

    def lan(self):
        pass

    def reset(self):
        pass

    def get_interfaces(self):
        iface_cmd = "ifconfig -s | awk '{print $1 }'"
        changeable_ifaces = []

        ifaces = subprocess.check_output(iface_cmd, shell=True).split("\n")

        # only get non-virtual interfaces
        r = re.compile(r'^(eth\d|wlan\d)$')
        for iface in ifaces:
            if re.match(r, iface):
                changeable_ifaces.append(iface)

        return changeable_ifaces

if __name__ == "__main__":
    if len(sys.argv) > 1:
       interfaces = sys.argv[1].split(",")
       m = mac_changer()
       for interface in interfaces:
           output = m.change_mac(interface)
