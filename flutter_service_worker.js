'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"index.html": "36d4f9fa551eaa8df7fcb65872350af8",
"/": "36d4f9fa551eaa8df7fcb65872350af8",
"assets/NOTICES": "8a3fa8552be1438e1a8a692c4cb2a1db",
"assets/assets/images/gallery_9.jpg": "17dc319e800f288ae68c554b43f29949",
"assets/assets/images/gallery_11.jpg": "687f6f793f52606e5010dcce39025337",
"assets/assets/images/gallery_12.jpg": "00a058dc5a36dd70628293a87806bab8",
"assets/assets/images/gallery_3.jpg": "44c5f0799b1961afa54becf9eabde9ee",
"assets/assets/images/gallery_2.jpg": "af1cf57845e8d5b3a497766ac48a5874",
"assets/assets/images/home_title.jpg": "dbf761be3977bf2409caf48542133db7",
"assets/assets/images/gallery_6.jpg": "7339b852e86d21bd65d7822bdf81d5ef",
"assets/assets/images/splash_icon.png": "293e8eec0ee04e29d294f45d5c5e01b8",
"assets/assets/images/bouquet.png": "3dcb6f4d3ba80d5ae2a498093756348a",
"assets/assets/images/gallery_5.jpg": "248ad61f3deb814df1b6f3dda641e292",
"assets/assets/images/gallery_13.jpg": "469e2bd2b03bed283edc6d6133f1669b",
"assets/assets/images/gallery_7.jpg": "d6ad1df97f8e06d2f0dbb384d9578d67",
"assets/assets/images/gallery_14.jpg": "b6882ad9a0e050f427b28c93aa3c7f40",
"assets/assets/images/gallery_10.jpg": "4d4207e8234fba890d47c66ca523b2ac",
"assets/assets/images/gallery_1.jpg": "17dc319e800f288ae68c554b43f29949",
"assets/assets/images/gallery_8.jpg": "28afa8f6c91c297fc0cbced8df38dac3",
"assets/assets/images/gallery_4.jpg": "476bc0336b631c8d085201c832bfb225",
"assets/assets/fonts/Francisco.woff": "b76f90bc037f63f9beec03aa2df6fec2",
"assets/assets/fonts/MaruBuri-Light.ttf": "1910f89081df89e38b1dcd822956de92",
"assets/assets/fonts/KNPSKkomi.otf": "dd3cf5bc1a615637bf760008e2dd165e",
"assets/assets/fonts/MaruBuri-Bold.ttf": "170bd21a62e8e9a0eadccfd9d578ed57",
"assets/assets/fonts/MaruBuri-Regular.ttf": "5a792d9e00f442f4b9222649b704fcf4",
"assets/assets/fonts/MaruBuri-SemiBold.ttf": "43dffdac3db1bcce6ffc1ffa6d93f5c8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "58836bc58b1ee06613f1d9e1472aaea9",
"assets/fonts/MaterialIcons-Regular.otf": "d119c66d80f30e8f8e446830dd1d181b",
"assets/FontManifest.json": "bfe78b66d4c00beae900544c8db98187",
"assets/AssetManifest.bin.json": "51da43674dcd19bfebaf0c128e5d7c5b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "a3174c0bc234a0208d3507e4d79aaab4",
"version.json": "2b521e10dfa0f067561de489a19d6620",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"main.dart.js": "fda6deec1f30f1576f14dc259a0ba808",
"icons/Icon-maskable-512.png": "79de3889e6889b542cda9ae7ce4803d8",
"icons/Icon-192.png": "a1232325f18e6e913e075952ba3a43df",
"icons/Icon-512.png": "6208574e0a2bed7848b488455d3c8d82",
"icons/Icon-maskable-192.png": "b49ac3b3853559b126362b778f9ee7de",
"favicon.png": "b8fc932282b9ab5270a2d1149e0ddde0",
"flutter_bootstrap.js": "bb4ec014a34a86fedc1afd124344d442"};
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
