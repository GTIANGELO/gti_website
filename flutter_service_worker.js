'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "456f518830f81d660163ca3c8d53657a",
"assets/AssetManifest.bin.json": "1fbc468be870039627ee18262e61038e",
"assets/AssetManifest.json": "d79267e384bcbe77b8a1f419b9390323",
"assets/assets/business_boosting/icon1.png": "f2b5a947ad9cdc169fdf2ecd3a54d1f3",
"assets/assets/business_boosting/icon2.png": "5ec02819a3a195c6f166863232892eba",
"assets/assets/business_boosting/icon3.png": "caae31f7b61facc43724e397a1b34aa8",
"assets/assets/business_boosting/icon4.png": "5eaac48a0acfb0ab0f3a5c7755f527d5",
"assets/assets/carousel_media/1.jpg": "cedfb60d2e1947e8c1b3bef16602a737",
"assets/assets/carousel_media/2.jpg": "67729fc42129efeb803781294a6373e0",
"assets/assets/carousel_media/3.jpg": "c858c53f5f82752fcb455682c53e8bb8",
"assets/assets/carousel_media/vid1.mp4": "1b7066f64976fae4f46505eebb4ad232",
"assets/assets/clientchart.png": "af5d80ca200386dc001fe79fc95374ad",
"assets/assets/client_logos/BFH.png": "92e9f927dfad6eab1b48b81395b3138d",
"assets/assets/client_logos/CHST.png": "56795e0870de2238cd14e553b1938acb",
"assets/assets/client_logos/HSA.png": "b959ccce8d04cfb734e4488a721bef33",
"assets/assets/client_logos/HSS.png": "159a0b443d3b56a71ee90759f6521a05",
"assets/assets/client_logos/HTC.png": "bd921b10a71d68348da4d6bf3ce389e5",
"assets/assets/client_logos/JCFC.png": "6c3c5caef3daf7aa380e87907d66faee",
"assets/assets/client_logos/LCCB.png": "ef852cbbf70642e960b5edde3806d9dd",
"assets/assets/client_logos/LCUP.png": "65c7afe18a95d10e3cf7fddbe35a9bcc",
"assets/assets/client_logos/LDCU.png": "3694367512a0429a93051556428c31c6",
"assets/assets/client_logos/LSU.png": "586019386cd4731c91eeb709b75c5f43",
"assets/assets/client_logos/MPCF.png": "9e83d77ef4df3ef0941464f09b11a487",
"assets/assets/client_logos/SBC.jpeg": "72721e87307006f55970f5bb1aebfab1",
"assets/assets/client_logos/STIWNU.png": "53a3bb16ca4409445f157194c4623fdf",
"assets/assets/client_logos/VMUF.png": "9eaf53811c3c6e9817693fc7f3aea726",
"assets/assets/client_logos/WUPA.png": "54b9c9052f981450a77e9c06bfdf28ea",
"assets/assets/client_logos/WUPC.png": "b84a1d93d94186202b45cecf44838066",
"assets/assets/contact.jpg": "f8c44eaec8c198cc57be51b959065bfa",
"assets/assets/gti_logo.png": "4ca8cedeb2e5e1d53172923489bd3af9",
"assets/assets/gti_logo_2.png": "53d5914d134576e8a9f5bac7ff1f928c",
"assets/assets/gti_sofware_brings/icon1.png": "efe737cd248544cd126e5ca2597b225d",
"assets/assets/gti_sofware_brings/icon2.png": "54b8fcb486034af41a9507bdfe755602",
"assets/assets/gti_sofware_brings/icon3.png": "cfb298b38fdd12e2830efe8b98d3a8d8",
"assets/assets/gti_sofware_brings/icon4.png": "f3a2c9e9332fbd1115e06f1ce83d469e",
"assets/assets/gti_sofware_brings/icon5.png": "bfb370e86f0d0a840286a3bfa0316984",
"assets/assets/gti_sofware_brings/icon6.png": "2d618046d711c02fb2ffb7e5acecc6a5",
"assets/assets/list_of_services/icon1.png": "64acda37f4476a9dee1016b510eadbe1",
"assets/assets/list_of_services/icon10.png": "cc8535eb7efc06f2e5deaf780fcfa837",
"assets/assets/list_of_services/icon11.png": "11d20e44fc86048370368c403054c56d",
"assets/assets/list_of_services/icon2.png": "6618beb827707c00d8caedde206b8ad0",
"assets/assets/list_of_services/icon3.png": "b3f6200e523e9358e96f232667d9907e",
"assets/assets/list_of_services/icon4.png": "8e53242f21b768334c46466b047c1168",
"assets/assets/list_of_services/icon5.png": "77dcb0b7a3d21d1ebbc563d414e02e35",
"assets/assets/list_of_services/icon6.png": "96ec19a61d31945ff49e73c5d0c6473f",
"assets/assets/list_of_services/icon7.png": "b448104104aad3f965eff1eef6068468",
"assets/assets/list_of_services/icon8.png": "a2ea8ce0ac29a2ae1c918c480dde62d1",
"assets/assets/list_of_services/icon9.png": "2ca77aa71ba1069b25505016f414d874",
"assets/assets/sabg.png": "b692e4d91f211329d333fa8fe9530201",
"assets/assets/sass.png": "703e84f002027c4fef3b5c6d8b3e7a7e",
"assets/assets/verify.png": "564a99cc4995491cd775c26e79f6ea28",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "1b3e1eec3bcc011b6b36de6b7bda8f64",
"assets/NOTICES": "4ea45209e722987d6b3dcc885f4d0565",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "3eedc108bede682d32c54cc3e777e08b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a0f7e6f1db069f6388bf35bc24ff0bcc",
"/": "a0f7e6f1db069f6388bf35bc24ff0bcc",
"main.dart.js": "564959a8153392f4f82b84dd57613c17",
"manifest.json": "49be7b1866839900427984f4e0af64a0",
"version.json": "7cf5819e445e8f5cb1b6f8e1dcb2a611"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
