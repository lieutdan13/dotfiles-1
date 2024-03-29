/******************************************************************************
 * user.js                                                                    *
 * https://github.com/pyllyukko/user.js                                       *
 ******************************************************************************/

// disable HTML frames
// WARNING: might make your life difficult!
//user_pref("browser.frames.enabled",		false);

// Display an error message indicating the entered information is not a valid
// URL instead of asking from google.
// http://kb.mozillazine.org/Keyword.enabled#Caveats
user_pref("keyword.enabled",			false);

// disable link prefetching
// http://kb.mozillazine.org/Network.prefetch-next
user_pref("network.prefetch-next",		false);

// disable Location-Aware Browsing
// http://www.mozilla.org/en-US/firefox/geolocation/
user_pref("geo.enabled",			false);

// https://wiki.mozilla.org/Platform/Features/Telemetry
// https://www.mozilla.org/en-US/legal/privacy/firefox.html#telemetry
// https://wiki.mozilla.org/Security/Reviews/Firefox6/ReviewNotes/telemetry
user_pref("toolkit.telemetry.enabled",			false);

// always ask the user where to download
// https://developer.mozilla.org/en/Download_Manager_preferences
user_pref("browser.download.useDownloadDir",		false);

// https://wiki.mozilla.org/Polaris#Tracking_protection
// https://support.mozilla.org/en-US/kb/tracking-protection-firefox
// TODO: are these two the same?
user_pref("privacy.trackingprotection.enabled",		true);
user_pref("browser.polaris.enabled",			true);

// don't try to guess where i'm trying to go!!!
// http://www-archive.mozilla.org/docs/end-user/domain-guessing.html
user_pref("browser.fixup.alternate.enabled",		false);

// https://trac.torproject.org/projects/tor/wiki/doc/TorifyHOWTO/WebBrowsers
user_pref("network.proxy.socks_remote_dns",		true);

// http://kb.mozillazine.org/Network.proxy.type
// the default in Firefox for Linux is to use system proxy settings.
// We change it to direct connection
//user_pref("network.proxy.type", 0);

// https://secure.wikimedia.org/wikibooks/en/wiki/Grsecurity/Application-specific_Settings#Firefox_.28or_Iceweasel_in_Debian.29
user_pref("javascript.options.methodjit.chrome",	false);
user_pref("javascript.options.methodjit.content",	false);

// disable the built-in PDF viewer
//user_pref("pdfjs.disabled",				true);

// DO NOT consult a third-party provider to determine whether a site is phishy
// http://kb.mozillazine.org/Browser.safebrowsing.remoteLookups
user_pref("browser.safebrowsing.remoteLookups",		false);

// disable sending of the health report
// https://support.mozilla.org/en-US/kb/firefox-health-report-understand-your-browser-perf
user_pref("datareporting.healthreport.uploadEnabled",	false);

// flash - never activate
user_pref("plugin.state.flash",				0);

// http://kb.mozillazine.org/Dom.storage.enabled
// http://dev.w3.org/html5/webstorage/#dom-localstorage
// you can also see this with Panopticlick's "DOM localStorage"
user_pref("dom.storage.enabled",				false);

// don't reveal internal IPs
// http://net.ipcalf.com/
user_pref("media.peerconnection.enabled",			false);
// getUserMedia
// https://wiki.mozilla.org/Media/getUserMedia
// https://developer.mozilla.org/en-US/docs/Web/API/Navigator
user_pref("media.navigator.enabled",				false);
// https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager
user_pref("dom.battery.enabled",				false);
// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
user_pref("dom.telephony.enabled",				false);
// https://developer.mozilla.org/en-US/docs/Web/API/navigator.sendBeacon
user_pref("beacon.enabled",					false);

user_pref("media.webspeech.recognition.enable",			false);

// Disable getUserMedia screen sharing
// https://mozilla.github.io/webrtc-landing/gum_test.html
user_pref("media.getusermedia.screensharing.enabled",		false);

// Disable new tab tile ads & preload
// http://www.thewindowsclub.com/disable-remove-ad-tiles-from-firefox
// http://forums.mozillazine.org/viewtopic.php?p=13876331&sid=811f876b0a8869c2e5b81e059d72f264#p13876331
user_pref("browser.newtabpage.enhanced",			false);
user_pref("browser.newtab.preload",				false);

// http://kb.mozillazine.org/Browser.send_pings
user_pref("browser.send_pings",					false);

// https://developer.mozilla.org/en-US/docs/IndexedDB
// https://wiki.mozilla.org/Security/Reviews/Firefox4/IndexedDB_Security_Review
// TODO: find out why html5test still reports this as available
// NOTE: this is enabled for now, as disabling this seems to break some plugins.
//       see: http://forums.mozillazine.org/viewtopic.php?p=13842047&sid=041e5edcae225759b7cfffd43fc518d0#p13842047
user_pref("dom.indexedDB.enabled",				true);

// http://kb.mozillazine.org/Network.dns.disablePrefetch
user_pref("network.dns.disablePrefetch",			true);

// http://kb.mozillazine.org/Browser.search.suggest.enabled
user_pref("browser.search.suggest.enabled",			false);

// TODO: "Access Your Location" "Maintain Offline Storage" "Show Notifications"

/* mixed content stuff
 *   - https://developer.mozilla.org/en-US/docs/Site_Compatibility_for_Firefox_23#Non-SSL_contents_on_SSL_pages_are_blocked_by_default
 *   - https://blog.mozilla.org/tanvi/2013/04/10/mixed-content-blocking-enabled-in-firefox-23/
 */
user_pref("security.mixed_content.block_active_content",	true);
// Mixed Passive Content (a.k.a. Mixed Display Content).
user_pref("security.mixed_content.block_display_content",	true);

// disable gamepad input
// http://www.w3.org/TR/gamepad/
user_pref("dom.gamepad.enabled",				false);

// disable virtual reality devices
// https://developer.mozilla.org/en-US/Firefox/Releases/36#Interfaces.2FAPIs.2FDOM
user_pref("dom.vr.enabled",					false);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.7 Disable JAR from opening Unsafe File Types
// http://kb.mozillazine.org/Network.jar.open-unsafe-types
user_pref("network.jar.open-unsafe-types",			false);

// https://blog.mozilla.org/security/2012/10/11/click-to-play-plugins-blocklist-style/
user_pref("plugins.click_to_play",				true);

// disable webGL
// http://www.contextis.com/resources/blog/webgl-new-dimension-browser-exploitation/
user_pref("webgl.disabled",					true);

// update add-ons automatically
// https://blog.mozilla.org/addons/how-to-turn-off-add-on-updates/
user_pref("extensions.update.enabled",				true);

// http://kb.mozillazine.org/Extensions.blocklist.enabled
user_pref("extensions.blocklist.enabled",			true);

/******************************************************************************
 * HTTP                                                                       *
 *                                                                            *
 ******************************************************************************/

// disallow NTLMv1
// https://bugzilla.mozilla.org/show_bug.cgi?id=828183
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1",	false);
// it is still allowed through HTTPS. uncomment the following to disable it completely.
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1-https",	false);

// https://bugzilla.mozilla.org/show_bug.cgi?id=855326
user_pref("security.csp.experimentalEnabled",			true);

// CSP https://developer.mozilla.org/en-US/docs/Web/Security/CSP/Introducing_Content_Security_Policy
user_pref("security.csp.enable",				true);

// DNT HTTP header
// http://dnt.mozilla.org/
// https://en.wikipedia.org/wiki/Do_not_track_header
//user_pref("privacy.donottrackheader.enabled",			true);

// http://kb.mozillazine.org/Network.http.sendRefererHeader#0
// https://bugzilla.mozilla.org/show_bug.cgi?id=822869
// Send a referer header with the target URI as the source
user_pref("network.http.sendRefererHeader",			1);
user_pref("network.http.referer.spoofSource",			1);
// CIS Version 1.2.0 October 21st, 2011 2.4.3 Disable Referer from an SSL Website
user_pref("network.http.sendSecureXSiteReferrer",		false);

/******************************************************************************
 * caching                                                                    *
 *                                                                            *
 ******************************************************************************/

// http://kb.mozillazine.org/Browser.sessionstore.postdata
// NOTE: relates to CIS 2.5.7
user_pref("browser.sessionstore.postdata",		0);
// http://kb.mozillazine.org/Browser.sessionstore.enabled
user_pref("browser.sessionstore.enabled",		false);

// http://kb.mozillazine.org/Browser.cache.offline.enable
user_pref("browser.cache.offline.enable",		false);

// always use private browsing
// https://support.mozilla.org/en-US/kb/Private-Browsing
// https://wiki.mozilla.org/PrivateBrowsing
user_pref("browser.privatebrowsing.autostart",		true);
user_pref("extensions.ghostery.privateBrowsing",	true);

// clear history when firefox closes
// https://support.mozilla.org/en-US/kb/Clear%20Recent%20History#w_how-do-i-make-firefox-clear-my-history-automatically
user_pref("privacy.sanitize.sanitizeOnShutdown",	true);
user_pref("privacy.clearOnShutdown.cache",		true);
user_pref("privacy.clearOnShutdown.cookies",		true);
user_pref("privacy.clearOnShutdown.downloads",		true);
user_pref("privacy.clearOnShutdown.formdata",		true);
user_pref("privacy.clearOnShutdown.history",		true);
user_pref("privacy.clearOnShutdown.offlineApps",	true);
user_pref("privacy.clearOnShutdown.passwords",		true);
user_pref("privacy.clearOnShutdown.sessions",		true);
user_pref("privacy.clearOnShutdown.siteSettings",	true);

// don't remember browsing history
user_pref("places.history.enabled",			false);

// The cookie expires at the end of the session (when the browser closes).
// http://kb.mozillazine.org/Network.cookie.lifetimePolicy#2
user_pref("network.cookie.lifetimePolicy",		2);

// http://kb.mozillazine.org/Browser.cache.disk.enable
user_pref("browser.cache.disk.enable",			false);

// http://kb.mozillazine.org/Browser.cache.memory.enable
//user_pref("browser.cache.memory.enable",		false);

// CIS Version 1.2.0 October 21st, 2011 2.5.8 Disable Caching of SSL Pages
user_pref("browser.cache.disk_cache_ssl",		false);

// CIS Version 1.2.0 October 21st, 2011 2.5.2 Disallow Credential Storage
user_pref("signon.rememberSignons",			false);

// CIS Version 1.2.0 October 21st, 2011 2.5.4 Delete History and Form Data
// http://kb.mozillazine.org/Browser.history_expire_days
user_pref("browser.history_expire_days",		0);

// http://kb.mozillazine.org/Browser.history_expire_sites
user_pref("browser.history_expire_sites",		0);

// http://kb.mozillazine.org/Browser.history_expire_visits
user_pref("browser.history_expire_visits",		0);

// CIS Version 1.2.0 October 21st, 2011 2.5.5 Delete Download History
// Zero (0) is an indication that no download history is retained for the current profile.
user_pref("browser.download.manager.retention",		0);

// CIS Version 1.2.0 October 21st, 2011 2.5.6 Delete Search and Form History
user_pref("browser.formfill.enable",			false);
user_pref("browser.formfill.expire_days",		0);

// CIS Version 1.2.0 October 21st, 2011 2.5.7 Clear SSL Form Session Data
// http://kb.mozillazine.org/Browser.sessionstore.privacy_level#2
// Store extra session data for unencrypted (non-HTTPS) sites only.
// NOTE: CIS says 1, we use 2
user_pref("browser.sessionstore.privacy_level",		2);

/******************************************************************************
 * UI related                                                                 *
 *                                                                            *
 ******************************************************************************/

// https://wiki.mozilla.org/Privacy/Reviews/New_Tab
user_pref("browser.newtabpage.enabled",			false);

// CIS Version 1.2.0 October 21st, 2011 2.1.2 Enable Auto Notification of Outdated Plugins
// https://wiki.mozilla.org/Firefox3.6/Plugin_Update_Awareness_Security_Review
user_pref("plugins.update.notifyUser",			true);

// CIS Version 1.2.0 October 21st, 2011 2.1.3 Enable Information Bar for Outdated Plugins
user_pref("plugins.hide_infobar_for_outdated_plugin",	false);

// CIS Version 1.2.0 October 21st, 2011 2.2.2 Enable Warning of Loading Mixed Content
user_pref("security.warn_viewing_mixed",		true);

// CIS Version 1.2.0 October 21st, 2011 2.2.3 Enable Warning of Using Weak Encryption
user_pref("security.warn_entering_weak",		true);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.6 Enable IDN Show Punycode
// http://kb.mozillazine.org/Network.IDN_show_punycode
user_pref("network.IDN_show_punycode",			true);

// http://kb.mozillazine.org/About:config_entries#Browser
// http://kb.mozillazine.org/Inline_autocomplete
user_pref("browser.urlbar.autoFill",			false);
user_pref("browser.urlbar.autoFill.typed",		false);

// http://www.labnol.org/software/browsers/prevent-firefox-showing-bookmarks-address-location-bar/3636/
// http://kb.mozillazine.org/Browser.urlbar.maxRichResults
// "Setting the preference to 0 effectively disables the Location Bar dropdown entirely."
user_pref("browser.urlbar.maxRichResults",		0);

// https://blog.mozilla.org/security/2010/03/31/plugging-the-css-history-leak/
// http://dbaron.org/mozilla/visited-privacy
user_pref("layout.css.visited_links_enabled",		false);

// http://kb.mozillazine.org/Places.frecency.unvisited%28place_type%29Bonus

// http://kb.mozillazine.org/Disabling_autocomplete_-_Firefox#Firefox_3.5
user_pref("browser.urlbar.autocomplete.enabled",	false);

// http://kb.mozillazine.org/Signon.autofillForms
// https://www.torproject.org/projects/torbrowser/design/#identifier-linkability
user_pref("signon.autofillForms",			false);

// do not check if firefox is the default browser
user_pref("browser.shell.checkDefaultBrowser",		false);

// https://developer.mozilla.org/en/Preferences/Mozilla_preferences_for_uber-geeks
// see also CVE-2009-3555
user_pref("security.ssl.warn_missing_rfc5746",		1);

// CIS Version 1.2.0 October 21st, 2011 2.5.3 Disable Prompting for Credential Storage
user_pref("security.ask_for_password",			0);

/******************************************************************************
 * TLS / HTTPS / OCSP related stuff                                           *
 *                                                                            *
 ******************************************************************************/

// https://blog.mozilla.org/security/2012/11/01/preloading-hsts/
// https://wiki.mozilla.org/Privacy/Features/HSTS_Preload_List
user_pref("network.stricttransportsecurity.preloadlist",	true);

// enable SPDY
// https://en.wikipedia.org/wiki/SPDY
user_pref("network.http.spdy.enabled",			true);
user_pref("network.http.spdy.enabled.v3",		true);
user_pref("network.http.spdy.enabled.v3-1",		true);

// CIS Version 1.2.0 October 21st, 2011 2.2.4 Enable Online Certificate Status Protocol
user_pref("security.OCSP.enabled",			true);

// https://blog.mozilla.org/security/2013/07/29/ocsp-stapling-in-firefox/
user_pref("security.ssl.enable_ocsp_stapling",		true);

// require certificate revocation check through OCSP protocol.
// NOTICE: this leaks information about the sites you visit to the CA.
user_pref("security.OCSP.require",			true);

// https://www.blackhat.com/us-13/briefings.html#NextGen
user_pref("security.enable_tls_session_tickets",	false);

// TLS 1.[012]
// http://kb.mozillazine.org/Security.tls.version.max
// 1 = TLS 1.0 is the minimum required / maximum supported encryption protocol. (This is the current default for the maximum supported version.)
// 2 = TLS 1.1 is the minimum required / maximum supported encryption protocol.
user_pref("security.tls.version.min",			1);
user_pref("security.tls.version.max",			3);

// disable SSLv3 (CVE-2014-3566)
user_pref("security.enable_ssl3",			false);

// pinning
// https://wiki.mozilla.org/SecurityEngineering/Public_Key_Pinning#How_to_use_pinning
// "2. Strict. Pinning is always enforced."
user_pref("security.cert_pinning.enforcement_level",	2);

// https://wiki.mozilla.org/Security:Renegotiation#security.ssl.treat_unsafe_negotiation_as_broken
// see also CVE-2009-3555
user_pref("security.ssl.treat_unsafe_negotiation_as_broken",	true);

// https://wiki.mozilla.org/Security:Renegotiation#security.ssl.require_safe_negotiation
// this makes browsing next to impossible=) (13.2.2012)
// update: the world is not ready for this! (6.5.2014)
// see also CVE-2009-3555
//user_pref("security.ssl.require_safe_negotiation",	true);

/******************************************************************************
 * CIPHERS                                                                    *
 *                                                                            *
 * you can debug the SSL handshake with tshark: tshark -t ad -n -i wlan0 -T text -V -R ssl.handshake
 ******************************************************************************/

// disable null ciphers
user_pref("security.ssl3.rsa_null_sha",		false);
user_pref("security.ssl3.rsa_null_md5",		false);
user_pref("security.ssl3.ecdhe_rsa_null_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_null_sha",	false);
user_pref("security.ssl3.ecdh_rsa_null_sha",	false);
user_pref("security.ssl3.ecdh_ecdsa_null_sha",	false);

/* SEED
 * https://en.wikipedia.org/wiki/SEED
 */
user_pref("security.ssl3.rsa_seed_sha",		false);

// 40 bits...
user_pref("security.ssl3.rsa_rc4_40_md5",	false);
user_pref("security.ssl3.rsa_rc2_40_md5",	false);

// 56 bits
user_pref("security.ssl3.rsa_1024_rc4_56_sha",	false);

// rest with MD5
user_pref("security.ssl3.rsa_rc4_128_md5",	false);

// 128 bits
user_pref("security.ssl3.rsa_rc4_128_sha",		false);
//user_pref("security.ssl3.rsa_rc4_128_md5",		false);
user_pref("security.ssl3.rsa_camellia_128_sha",		false);
//user_pref("security.ssl3.rsa_aes_128_sha",		false);
user_pref("security.ssl3.ecdhe_rsa_rc4_128_sha",	false);
user_pref("security.ssl3.ecdhe_rsa_aes_128_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha",	false);
user_pref("security.ssl3.ecdh_rsa_rc4_128_sha",		false);
user_pref("security.ssl3.ecdh_rsa_aes_128_sha",		false);
user_pref("security.ssl3.ecdh_ecdsa_rc4_128_sha",	false);
user_pref("security.ssl3.ecdh_ecdsa_aes_128_sha",	false);
user_pref("security.ssl3.dhe_rsa_camellia_128_sha",	false);
user_pref("security.ssl3.dhe_rsa_aes_128_sha",		false);

/*
 * 3DES -> false because effective key size < 128
 *
 *   https://en.wikipedia.org/wiki/3des#Security
 *   http://en.citizendium.org/wiki/Meet-in-the-middle_attack
 *
 * see also: http://www-archive.mozilla.org/projects/security/pki/nss/ssl/fips-ssl-ciphersuites.html
 */
user_pref("security.ssl3.dhe_dss_des_ede3_sha",		false);
user_pref("security.ssl3.dhe_rsa_des_ede3_sha",		false);
user_pref("security.ssl3.ecdh_ecdsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdh_rsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdhe_ecdsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdhe_rsa_des_ede3_sha",	false);
user_pref("security.ssl3.rsa_des_ede3_sha",		false);
user_pref("security.ssl3.rsa_fips_des_ede3_sha",	false);


// ciphers with ECDH (without /e$/)
user_pref("security.ssl3.ecdh_rsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdh_rsa_aes_256_sha",		false);
user_pref("security.ssl3.ecdh_ecdsa_des_ede3_sha",	false);
user_pref("security.ssl3.ecdh_ecdsa_aes_256_sha",	false);

// 256 bits without PFS
user_pref("security.ssl3.rsa_camellia_256_sha",		false);
user_pref("security.ssl3.rsa_aes_256_sha",		false);


// ciphers with ECDHE and > 128bits
user_pref("security.ssl3.ecdhe_rsa_aes_256_sha",	true);
user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha",	true);

// GCM... yes please!
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256",	true);
user_pref("security.ssl3.ecdhe_rsa_aes_128_gcm_sha256",		true);

/* ciphers with DHE and > 128bits
 * des-ede3 = 168 bits
 */
user_pref("security.ssl3.dhe_rsa_camellia_256_sha",	true);
//user_pref("security.ssl3.dhe_dss_camellia_256_sha",	true);
user_pref("security.ssl3.dhe_rsa_aes_256_sha",		true);
//user_pref("security.ssl3.dhe_dss_aes_256_sha",		true);

// ciphers with DSA (max 1024 bits)
user_pref("security.ssl3.dhe_dss_aes_128_sha",		false);
user_pref("security.ssl3.dhe_dss_aes_256_sha",		false);
user_pref("security.ssl3.dhe_dss_camellia_128_sha",	false);
user_pref("security.ssl3.dhe_dss_camellia_256_sha",	false);
user_pref("security.ssl3.dhe_dss_des_ede3_sha",		false);

/* fallbacks
 */
user_pref("security.ssl3.rsa_aes_256_sha",		true);
// CloudFront
user_pref("security.ssl3.rsa_aes_128_sha",		true);

/******************************************************************************
 * user-agent...
 *
 * https://panopticlick.eff.org/
 *
 * you can copy the value from extensions.torbutton.useragent_override
 *
 * default: "Mozilla/5.0 (X11; Linux i686 on x86_64; rv:9.0.1) Gecko/20100101 Firefox/9.0.1"
 * before: 15.53 / 47249.6
 *
 * https://github.com/ioerror/crlwatch/blob/master/src/fetch-crls.sh
 * "Mozilla/5.0 (Windows; U; Windows NT 6.1; LANG; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
 * after: 12.15 bits of identifying information
 *
 * "Mozilla/5.0 (Windows NT 6.1; rv:5.0) Gecko/20100101 Firefox/5.0"
 * after: 6.73 / 106.43
 ******************************************************************************/
//user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 6.1; rv:5.0) Gecko/20100101 Firefox/5.0");

/******************************************************************************
 * CIS Security Configuration Benchmark For Mozilla Firefox                   *
 * Version 1.2.0 October 21st, 2011                                           *
 ******************************************************************************/

// CIS 2.1.1 Enable Auto Update
// this is disabled for now. it is better to patch through package management.
//user_pref("app.update.auto", true);

/*
 * 2.3 Dynamic Content Settings
 */

// CIS 2.3.2 Disable Downloading on Desktop
user_pref("browser.download.folderList",		2);

// CIS 2.3.4 Block Reported Web Forgeries
// http://kb.mozillazine.org/Browser.safebrowsing.enabled
// http://kb.mozillazine.org/Safe_browsing
//
// "or submit URLs to a third party"
user_pref("browser.safebrowsing.enabled",		false);

// CIS 2.3.5 Block Reported Attack Sites
// http://kb.mozillazine.org/Browser.safebrowsing.malware.enabled
user_pref("browser.safebrowsing.malware.enabled",	true);

// CIS 2.3.6 Disable Displaying Javascript in History URLs
user_pref("browser.urlbar.filter.javascript",		true);

/*
 * 2.5 Privacy Settings
 */

// CIS 2.5.1 Accept Only 1st Party Cookies
// http://kb.mozillazine.org/Network.cookie.cookieBehavior#1
user_pref("network.cookie.cookieBehavior",		1);

/*
 * 2.7 Advanced JavaScript Settings
 */

// CIS 2.7.4 Disable Scripting of Plugins by JavaScript
user_pref("security.xpconnect.plugin.unrestricted",	false);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.8 Set File URI Origin Policy
// http://kb.mozillazine.org/Security.fileuri.strict_origin_policy
user_pref("security.fileuri.strict_origin_policy",	true);
