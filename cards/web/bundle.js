(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
// shim for using process in browser
var process = module.exports = {};

// cached from whatever global is present so that test runners that stub it
// don't break things.  But we need to wrap it in a try catch in case it is
// wrapped in strict mode code which doesn't define any globals.  It's inside a
// function because try/catches deoptimize in certain engines.

var cachedSetTimeout;
var cachedClearTimeout;

function defaultSetTimout() {
    throw new Error('setTimeout has not been defined');
}
function defaultClearTimeout () {
    throw new Error('clearTimeout has not been defined');
}
(function () {
    try {
        if (typeof setTimeout === 'function') {
            cachedSetTimeout = setTimeout;
        } else {
            cachedSetTimeout = defaultSetTimout;
        }
    } catch (e) {
        cachedSetTimeout = defaultSetTimout;
    }
    try {
        if (typeof clearTimeout === 'function') {
            cachedClearTimeout = clearTimeout;
        } else {
            cachedClearTimeout = defaultClearTimeout;
        }
    } catch (e) {
        cachedClearTimeout = defaultClearTimeout;
    }
} ())
function runTimeout(fun) {
    if (cachedSetTimeout === setTimeout) {
        //normal enviroments in sane situations
        return setTimeout(fun, 0);
    }
    // if setTimeout wasn't available but was latter defined
    if ((cachedSetTimeout === defaultSetTimout || !cachedSetTimeout) && setTimeout) {
        cachedSetTimeout = setTimeout;
        return setTimeout(fun, 0);
    }
    try {
        // when when somebody has screwed with setTimeout but no I.E. maddness
        return cachedSetTimeout(fun, 0);
    } catch(e){
        try {
            // When we are in I.E. but the script has been evaled so I.E. doesn't trust the global object when called normally
            return cachedSetTimeout.call(null, fun, 0);
        } catch(e){
            // same as above but when it's a version of I.E. that must have the global object for 'this', hopfully our context correct otherwise it will throw a global error
            return cachedSetTimeout.call(this, fun, 0);
        }
    }


}
function runClearTimeout(marker) {
    if (cachedClearTimeout === clearTimeout) {
        //normal enviroments in sane situations
        return clearTimeout(marker);
    }
    // if clearTimeout wasn't available but was latter defined
    if ((cachedClearTimeout === defaultClearTimeout || !cachedClearTimeout) && clearTimeout) {
        cachedClearTimeout = clearTimeout;
        return clearTimeout(marker);
    }
    try {
        // when when somebody has screwed with setTimeout but no I.E. maddness
        return cachedClearTimeout(marker);
    } catch (e){
        try {
            // When we are in I.E. but the script has been evaled so I.E. doesn't  trust the global object when called normally
            return cachedClearTimeout.call(null, marker);
        } catch (e){
            // same as above but when it's a version of I.E. that must have the global object for 'this', hopfully our context correct otherwise it will throw a global error.
            // Some versions of I.E. have different rules for clearTimeout vs setTimeout
            return cachedClearTimeout.call(this, marker);
        }
    }



}
var queue = [];
var draining = false;
var currentQueue;
var queueIndex = -1;

function cleanUpNextTick() {
    if (!draining || !currentQueue) {
        return;
    }
    draining = false;
    if (currentQueue.length) {
        queue = currentQueue.concat(queue);
    } else {
        queueIndex = -1;
    }
    if (queue.length) {
        drainQueue();
    }
}

function drainQueue() {
    if (draining) {
        return;
    }
    var timeout = runTimeout(cleanUpNextTick);
    draining = true;

    var len = queue.length;
    while(len) {
        currentQueue = queue;
        queue = [];
        while (++queueIndex < len) {
            if (currentQueue) {
                currentQueue[queueIndex].run();
            }
        }
        queueIndex = -1;
        len = queue.length;
    }
    currentQueue = null;
    draining = false;
    runClearTimeout(timeout);
}

process.nextTick = function (fun) {
    var args = new Array(arguments.length - 1);
    if (arguments.length > 1) {
        for (var i = 1; i < arguments.length; i++) {
            args[i - 1] = arguments[i];
        }
    }
    queue.push(new Item(fun, args));
    if (queue.length === 1 && !draining) {
        runTimeout(drainQueue);
    }
};

// v8 likes predictible objects
function Item(fun, array) {
    this.fun = fun;
    this.array = array;
}
Item.prototype.run = function () {
    this.fun.apply(null, this.array);
};
process.title = 'browser';
process.browser = true;
process.env = {};
process.argv = [];
process.version = ''; // empty string to avoid regexp issues
process.versions = {};

function noop() {}

process.on = noop;
process.addListener = noop;
process.once = noop;
process.off = noop;
process.removeListener = noop;
process.removeAllListeners = noop;
process.emit = noop;
process.prependListener = noop;
process.prependOnceListener = noop;

process.listeners = function (name) { return [] }

process.binding = function (name) {
    throw new Error('process.binding is not supported');
};

process.cwd = function () { return '/' };
process.chdir = function (dir) {
    throw new Error('process.chdir is not supported');
};
process.umask = function() { return 0; };

},{}],2:[function(require,module,exports){
const htmlToImage = require("html-to-image")
const download = require("downloadjs")

window.htmlToImage = htmlToImage
window.download = download


},{"downloadjs":3,"html-to-image":11}],3:[function(require,module,exports){
//download.js v4.2, by dandavis; 2008-2016. [MIT] see http://danml.com/download.html for tests/usage
// v1 landed a FF+Chrome compat way of downloading strings to local un-named files, upgraded to use a hidden frame and optional mime
// v2 added named files via a[download], msSaveBlob, IE (10+) support, and window.URL support for larger+faster saves than dataURLs
// v3 added dataURL and Blob Input, bind-toggle arity, and legacy dataURL fallback was improved with force-download mime and base64 support. 3.1 improved safari handling.
// v4 adds AMD/UMD, commonJS, and plain browser support
// v4.1 adds url download capability via solo URL argument (same domain/CORS only)
// v4.2 adds semantic variable names, long (over 2MB) dataURL support, and hidden by default temp anchors
// https://github.com/rndme/download

(function (root, factory) {
	if (typeof define === 'function' && define.amd) {
		// AMD. Register as an anonymous module.
		define([], factory);
	} else if (typeof exports === 'object') {
		// Node. Does not work with strict CommonJS, but
		// only CommonJS-like environments that support module.exports,
		// like Node.
		module.exports = factory();
	} else {
		// Browser globals (root is window)
		root.download = factory();
  }
}(this, function () {

	return function download(data, strFileName, strMimeType) {

		var self = window, // this script is only for browsers anyway...
			defaultMime = "application/octet-stream", // this default mime also triggers iframe downloads
			mimeType = strMimeType || defaultMime,
			payload = data,
			url = !strFileName && !strMimeType && payload,
			anchor = document.createElement("a"),
			toString = function(a){return String(a);},
			myBlob = (self.Blob || self.MozBlob || self.WebKitBlob || toString),
			fileName = strFileName || "download",
			blob,
			reader;
			myBlob= myBlob.call ? myBlob.bind(self) : Blob ;
	  
		if(String(this)==="true"){ //reverse arguments, allowing download.bind(true, "text/xml", "export.xml") to act as a callback
			payload=[payload, mimeType];
			mimeType=payload[0];
			payload=payload[1];
		}


		if(url && url.length< 2048){ // if no filename and no mime, assume a url was passed as the only argument
			fileName = url.split("/").pop().split("?")[0];
			anchor.href = url; // assign href prop to temp anchor
		  	if(anchor.href.indexOf(url) !== -1){ // if the browser determines that it's a potentially valid url path:
        		var ajax=new XMLHttpRequest();
        		ajax.open( "GET", url, true);
        		ajax.responseType = 'blob';
        		ajax.onload= function(e){ 
				  download(e.target.response, fileName, defaultMime);
				};
        		setTimeout(function(){ ajax.send();}, 0); // allows setting custom ajax headers using the return:
			    return ajax;
			} // end if valid url?
		} // end if url?


		//go ahead and download dataURLs right away
		if(/^data:([\w+-]+\/[\w+.-]+)?[,;]/.test(payload)){
		
			if(payload.length > (1024*1024*1.999) && myBlob !== toString ){
				payload=dataUrlToBlob(payload);
				mimeType=payload.type || defaultMime;
			}else{			
				return navigator.msSaveBlob ?  // IE10 can't do a[download], only Blobs:
					navigator.msSaveBlob(dataUrlToBlob(payload), fileName) :
					saver(payload) ; // everyone else can save dataURLs un-processed
			}
			
		}else{//not data url, is it a string with special needs?
			if(/([\x80-\xff])/.test(payload)){			  
				var i=0, tempUiArr= new Uint8Array(payload.length), mx=tempUiArr.length;
				for(i;i<mx;++i) tempUiArr[i]= payload.charCodeAt(i);
			 	payload=new myBlob([tempUiArr], {type: mimeType});
			}		  
		}
		blob = payload instanceof myBlob ?
			payload :
			new myBlob([payload], {type: mimeType}) ;


		function dataUrlToBlob(strUrl) {
			var parts= strUrl.split(/[:;,]/),
			type= parts[1],
			decoder= parts[2] == "base64" ? atob : decodeURIComponent,
			binData= decoder( parts.pop() ),
			mx= binData.length,
			i= 0,
			uiArr= new Uint8Array(mx);

			for(i;i<mx;++i) uiArr[i]= binData.charCodeAt(i);

			return new myBlob([uiArr], {type: type});
		 }

		function saver(url, winMode){

			if ('download' in anchor) { //html5 A[download]
				anchor.href = url;
				anchor.setAttribute("download", fileName);
				anchor.className = "download-js-link";
				anchor.innerHTML = "downloading...";
				anchor.style.display = "none";
				document.body.appendChild(anchor);
				setTimeout(function() {
					anchor.click();
					document.body.removeChild(anchor);
					if(winMode===true){setTimeout(function(){ self.URL.revokeObjectURL(anchor.href);}, 250 );}
				}, 66);
				return true;
			}

			// handle non-a[download] safari as best we can:
			if(/(Version)\/(\d+)\.(\d+)(?:\.(\d+))?.*Safari\//.test(navigator.userAgent)) {
				if(/^data:/.test(url))	url="data:"+url.replace(/^data:([\w\/\-\+]+)/, defaultMime);
				if(!window.open(url)){ // popup blocked, offer direct download:
					if(confirm("Displaying New Document\n\nUse Save As... to download, then click back to return to this page.")){ location.href=url; }
				}
				return true;
			}

			//do iframe dataURL download (old ch+FF):
			var f = document.createElement("iframe");
			document.body.appendChild(f);

			if(!winMode && /^data:/.test(url)){ // force a mime that will download:
				url="data:"+url.replace(/^data:([\w\/\-\+]+)/, defaultMime);
			}
			f.src=url;
			setTimeout(function(){ document.body.removeChild(f); }, 333);

		}//end saver




		if (navigator.msSaveBlob) { // IE10+ : (has Blob, but not a[download] or URL)
			return navigator.msSaveBlob(blob, fileName);
		}

		if(self.URL){ // simple fast and modern way using Blob and URL:
			saver(self.URL.createObjectURL(blob), true);
		}else{
			// handle non-Blob()+non-URL browsers:
			if(typeof blob === "string" || blob.constructor===toString ){
				try{
					return saver( "data:" +  mimeType   + ";base64,"  +  self.btoa(blob)  );
				}catch(y){
					return saver( "data:" +  mimeType   + "," + encodeURIComponent(blob)  );
				}
			}

			// Blob but not URL support:
			reader=new FileReader();
			reader.onload=function(e){
				saver(this.result);
			};
			reader.readAsDataURL(blob);
		}
		return true;
	}; /* end download() */
}));

},{}],4:[function(require,module,exports){
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.applyStyle = void 0;
function applyStyle(node, options) {
    var style = node.style;
    if (options.backgroundColor) {
        style.backgroundColor = options.backgroundColor;
    }
    if (options.width) {
        style.width = "".concat(options.width, "px");
    }
    if (options.height) {
        style.height = "".concat(options.height, "px");
    }
    var manual = options.style;
    if (manual != null) {
        Object.keys(manual).forEach(function (key) {
            style[key] = manual[key];
        });
    }
    return node;
}
exports.applyStyle = applyStyle;

},{}],5:[function(require,module,exports){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.cloneNode = void 0;
var mimes_1 = require("./mimes");
var dataurl_1 = require("./dataurl");
var clone_pseudos_1 = require("./clone-pseudos");
var util_1 = require("./util");
function cloneCanvasElement(canvas) {
    return __awaiter(this, void 0, void 0, function () {
        var dataURL;
        return __generator(this, function (_a) {
            dataURL = canvas.toDataURL();
            if (dataURL === 'data:,') {
                return [2 /*return*/, canvas.cloneNode(false)];
            }
            return [2 /*return*/, (0, util_1.createImage)(dataURL)];
        });
    });
}
function cloneVideoElement(video, options) {
    return __awaiter(this, void 0, void 0, function () {
        var poster, contentType, dataURL;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    poster = video.poster;
                    contentType = (0, mimes_1.getMimeType)(poster);
                    return [4 /*yield*/, (0, dataurl_1.resourceToDataURL)(poster, contentType, options)];
                case 1:
                    dataURL = _a.sent();
                    return [2 /*return*/, (0, util_1.createImage)(dataURL)];
            }
        });
    });
}
function cloneSingleNode(node, options) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            if (node instanceof HTMLCanvasElement) {
                return [2 /*return*/, cloneCanvasElement(node)];
            }
            if (node instanceof HTMLVideoElement && node.poster) {
                return [2 /*return*/, cloneVideoElement(node, options)];
            }
            return [2 /*return*/, node.cloneNode(false)];
        });
    });
}
var isSlotElement = function (node) {
    return node.tagName != null && node.tagName.toUpperCase() === 'SLOT';
};
function cloneChildren(nativeNode, clonedNode, options) {
    var _a;
    return __awaiter(this, void 0, void 0, function () {
        var children;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0:
                    children = isSlotElement(nativeNode) && nativeNode.assignedNodes
                        ? (0, util_1.toArray)(nativeNode.assignedNodes())
                        : (0, util_1.toArray)(((_a = nativeNode.shadowRoot) !== null && _a !== void 0 ? _a : nativeNode).childNodes);
                    if (children.length === 0 || nativeNode instanceof HTMLVideoElement) {
                        return [2 /*return*/, clonedNode];
                    }
                    return [4 /*yield*/, children.reduce(function (deferred, child) {
                            return deferred
                                .then(function () { return cloneNode(child, options); })
                                .then(function (clonedChild) {
                                if (clonedChild) {
                                    clonedNode.appendChild(clonedChild);
                                }
                            });
                        }, Promise.resolve())];
                case 1:
                    _b.sent();
                    return [2 /*return*/, clonedNode];
            }
        });
    });
}
function cloneCSSStyle(nativeNode, clonedNode) {
    var targetStyle = clonedNode.style;
    if (!targetStyle) {
        return;
    }
    var sourceStyle = window.getComputedStyle(nativeNode);
    if (sourceStyle.cssText) {
        targetStyle.cssText = sourceStyle.cssText;
        targetStyle.transformOrigin = sourceStyle.transformOrigin;
    }
    else {
        (0, util_1.toArray)(sourceStyle).forEach(function (name) {
            var value = sourceStyle.getPropertyValue(name);
            if (name === 'font-size' && value.endsWith('px')) {
                var reducedFont = Math.floor(parseFloat(value.substring(0, value.length - 2))) - 0.1;
                value = "".concat(reducedFont, "px");
            }
            targetStyle.setProperty(name, value, sourceStyle.getPropertyPriority(name));
        });
    }
}
function cloneInputValue(nativeNode, clonedNode) {
    if (nativeNode instanceof HTMLTextAreaElement) {
        clonedNode.innerHTML = nativeNode.value;
    }
    if (nativeNode instanceof HTMLInputElement) {
        clonedNode.setAttribute('value', nativeNode.value);
    }
}
function cloneSelectValue(nativeNode, clonedNode) {
    if (nativeNode instanceof HTMLSelectElement) {
        var clonedSelect = clonedNode;
        var selectedOption = Array.from(clonedSelect.children).find(function (child) { return nativeNode.value === child.getAttribute('value'); });
        if (selectedOption) {
            selectedOption.setAttribute('selected', '');
        }
    }
}
function decorate(nativeNode, clonedNode) {
    if (clonedNode instanceof Element) {
        cloneCSSStyle(nativeNode, clonedNode);
        (0, clone_pseudos_1.clonePseudoElements)(nativeNode, clonedNode);
        cloneInputValue(nativeNode, clonedNode);
        cloneSelectValue(nativeNode, clonedNode);
    }
    return clonedNode;
}
function cloneNode(node, options, isRoot) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            if (!isRoot && options.filter && !options.filter(node)) {
                return [2 /*return*/, null];
            }
            return [2 /*return*/, Promise.resolve(node)
                    .then(function (clonedNode) { return cloneSingleNode(clonedNode, options); })
                    .then(function (clonedNode) { return cloneChildren(node, clonedNode, options); })
                    .then(function (clonedNode) { return decorate(node, clonedNode); })];
        });
    });
}
exports.cloneNode = cloneNode;

},{"./clone-pseudos":6,"./dataurl":7,"./mimes":12,"./util":13}],6:[function(require,module,exports){
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.clonePseudoElements = void 0;
var util_1 = require("./util");
function formatCSSText(style) {
    var content = style.getPropertyValue('content');
    return "".concat(style.cssText, " content: '").concat(content.replace(/'|"/g, ''), "';");
}
function formatCSSProperties(style) {
    return (0, util_1.toArray)(style)
        .map(function (name) {
        var value = style.getPropertyValue(name);
        var priority = style.getPropertyPriority(name);
        return "".concat(name, ": ").concat(value).concat(priority ? ' !important' : '', ";");
    })
        .join(' ');
}
function getPseudoElementStyle(className, pseudo, style) {
    var selector = ".".concat(className, ":").concat(pseudo);
    var cssText = style.cssText
        ? formatCSSText(style)
        : formatCSSProperties(style);
    return document.createTextNode("".concat(selector, "{").concat(cssText, "}"));
}
function clonePseudoElement(nativeNode, clonedNode, pseudo) {
    var style = window.getComputedStyle(nativeNode, pseudo);
    var content = style.getPropertyValue('content');
    if (content === '' || content === 'none') {
        return;
    }
    var className = (0, util_1.uuid)();
    try {
        clonedNode.className = "".concat(clonedNode.className, " ").concat(className);
    }
    catch (err) {
        return;
    }
    var styleElement = document.createElement('style');
    styleElement.appendChild(getPseudoElementStyle(className, pseudo, style));
    clonedNode.appendChild(styleElement);
}
function clonePseudoElements(nativeNode, clonedNode) {
    clonePseudoElement(nativeNode, clonedNode, ':before');
    clonePseudoElement(nativeNode, clonedNode, ':after');
}
exports.clonePseudoElements = clonePseudoElements;

},{"./util":13}],7:[function(require,module,exports){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.resourceToDataURL = exports.fetchAsDataURL = exports.makeDataUrl = exports.isDataUrl = void 0;
function getContentFromDataUrl(dataURL) {
    return dataURL.split(/,/)[1];
}
function isDataUrl(url) {
    return url.search(/^(data:)/) !== -1;
}
exports.isDataUrl = isDataUrl;
function makeDataUrl(content, mimeType) {
    return "data:".concat(mimeType, ";base64,").concat(content);
}
exports.makeDataUrl = makeDataUrl;
function fetchAsDataURL(url, init, process) {
    return __awaiter(this, void 0, void 0, function () {
        var res, blob;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, fetch(url, init)];
                case 1:
                    res = _a.sent();
                    if (res.status === 404) {
                        throw new Error("Resource \"".concat(res.url, "\" not found"));
                    }
                    return [4 /*yield*/, res.blob()];
                case 2:
                    blob = _a.sent();
                    return [2 /*return*/, new Promise(function (resolve, reject) {
                            var reader = new FileReader();
                            reader.onerror = reject;
                            reader.onloadend = function () {
                                try {
                                    resolve(process({ res: res, result: reader.result }));
                                }
                                catch (error) {
                                    reject(error);
                                }
                            };
                            reader.readAsDataURL(blob);
                        })];
            }
        });
    });
}
exports.fetchAsDataURL = fetchAsDataURL;
var cache = {};
function getCacheKey(url, contentType, includeQueryParams) {
    var key = url.replace(/\?.*/, '');
    if (includeQueryParams) {
        key = url;
    }
    // font resource
    if (/ttf|otf|eot|woff2?/i.test(key)) {
        key = key.replace(/.*\//, '');
    }
    return contentType ? "[".concat(contentType, "]").concat(key) : key;
}
function resourceToDataURL(resourceUrl, contentType, options) {
    return __awaiter(this, void 0, void 0, function () {
        var cacheKey, dataURL, content, error_1, msg;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    cacheKey = getCacheKey(resourceUrl, contentType, options.includeQueryParams);
                    if (cache[cacheKey] != null) {
                        return [2 /*return*/, cache[cacheKey]];
                    }
                    // ref: https://developer.mozilla.org/en/docs/Web/API/XMLHttpRequest/Using_XMLHttpRequest#Bypassing_the_cache
                    if (options.cacheBust) {
                        // eslint-disable-next-line no-param-reassign
                        resourceUrl += (/\?/.test(resourceUrl) ? '&' : '?') + new Date().getTime();
                    }
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    return [4 /*yield*/, fetchAsDataURL(resourceUrl, options.fetchRequestInit, function (_a) {
                            var res = _a.res, result = _a.result;
                            if (!contentType) {
                                // eslint-disable-next-line no-param-reassign
                                contentType = res.headers.get('Content-Type') || '';
                            }
                            return getContentFromDataUrl(result);
                        })];
                case 2:
                    content = _a.sent();
                    dataURL = makeDataUrl(content, contentType);
                    return [3 /*break*/, 4];
                case 3:
                    error_1 = _a.sent();
                    dataURL = options.imagePlaceholder || '';
                    msg = "Failed to fetch resource: ".concat(resourceUrl);
                    if (error_1) {
                        msg = typeof error_1 === 'string' ? error_1 : error_1.message;
                    }
                    if (msg) {
                        console.warn(msg);
                    }
                    return [3 /*break*/, 4];
                case 4:
                    cache[cacheKey] = dataURL;
                    return [2 /*return*/, dataURL];
            }
        });
    });
}
exports.resourceToDataURL = resourceToDataURL;

},{}],8:[function(require,module,exports){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.embedImages = void 0;
var embed_resources_1 = require("./embed-resources");
var util_1 = require("./util");
var dataurl_1 = require("./dataurl");
var mimes_1 = require("./mimes");
function embedBackground(clonedNode, options) {
    var _a;
    return __awaiter(this, void 0, void 0, function () {
        var background, cssString;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0:
                    background = (_a = clonedNode.style) === null || _a === void 0 ? void 0 : _a.getPropertyValue('background');
                    if (!background) return [3 /*break*/, 2];
                    return [4 /*yield*/, (0, embed_resources_1.embedResources)(background, null, options)];
                case 1:
                    cssString = _b.sent();
                    clonedNode.style.setProperty('background', cssString, clonedNode.style.getPropertyPriority('background'));
                    _b.label = 2;
                case 2: return [2 /*return*/];
            }
        });
    });
}
function embedImageNode(clonedNode, options) {
    return __awaiter(this, void 0, void 0, function () {
        var url, dataURL;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!(clonedNode instanceof HTMLImageElement && !(0, dataurl_1.isDataUrl)(clonedNode.src)) &&
                        !(clonedNode instanceof SVGImageElement &&
                            !(0, dataurl_1.isDataUrl)(clonedNode.href.baseVal))) {
                        return [2 /*return*/];
                    }
                    url = clonedNode instanceof HTMLImageElement
                        ? clonedNode.src
                        : clonedNode.href.baseVal;
                    return [4 /*yield*/, (0, dataurl_1.resourceToDataURL)(url, (0, mimes_1.getMimeType)(url), options)];
                case 1:
                    dataURL = _a.sent();
                    return [4 /*yield*/, new Promise(function (resolve, reject) {
                            clonedNode.onload = resolve;
                            clonedNode.onerror = reject;
                            if (clonedNode instanceof HTMLImageElement) {
                                clonedNode.srcset = '';
                                clonedNode.src = dataURL;
                            }
                            else {
                                clonedNode.href.baseVal = dataURL;
                            }
                        })];
                case 2:
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    });
}
function embedChildren(clonedNode, options) {
    return __awaiter(this, void 0, void 0, function () {
        var children, deferreds;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    children = (0, util_1.toArray)(clonedNode.childNodes);
                    deferreds = children.map(function (child) { return embedImages(child, options); });
                    return [4 /*yield*/, Promise.all(deferreds).then(function () { return clonedNode; })];
                case 1:
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    });
}
function embedImages(clonedNode, options) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!(clonedNode instanceof Element)) return [3 /*break*/, 4];
                    return [4 /*yield*/, embedBackground(clonedNode, options)];
                case 1:
                    _a.sent();
                    return [4 /*yield*/, embedImageNode(clonedNode, options)];
                case 2:
                    _a.sent();
                    return [4 /*yield*/, embedChildren(clonedNode, options)];
                case 3:
                    _a.sent();
                    _a.label = 4;
                case 4: return [2 /*return*/];
            }
        });
    });
}
exports.embedImages = embedImages;

},{"./dataurl":7,"./embed-resources":9,"./mimes":12,"./util":13}],9:[function(require,module,exports){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.embedResources = exports.shouldEmbed = exports.embed = exports.parseURLs = void 0;
var util_1 = require("./util");
var mimes_1 = require("./mimes");
var dataurl_1 = require("./dataurl");
var URL_REGEX = /url\((['"]?)([^'"]+?)\1\)/g;
var URL_WITH_FORMAT_REGEX = /url\([^)]+\)\s*format\((["']?)([^"']+)\1\)/g;
var FONT_SRC_REGEX = /src:\s*(?:url\([^)]+\)\s*format\([^)]+\)[,;]\s*)+/g;
function toRegex(url) {
    // eslint-disable-next-line no-useless-escape
    var escaped = url.replace(/([.*+?^${}()|\[\]\/\\])/g, '\\$1');
    return new RegExp("(url\\(['\"]?)(".concat(escaped, ")(['\"]?\\))"), 'g');
}
function parseURLs(cssText) {
    var urls = [];
    cssText.replace(URL_REGEX, function (raw, quotation, url) {
        urls.push(url);
        return raw;
    });
    return urls.filter(function (url) { return !(0, dataurl_1.isDataUrl)(url); });
}
exports.parseURLs = parseURLs;
function embed(cssText, resourceURL, baseURL, options, getContentFromUrl) {
    return __awaiter(this, void 0, void 0, function () {
        var resolvedURL, contentType, dataURL, content, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 5, , 6]);
                    resolvedURL = baseURL ? (0, util_1.resolveUrl)(resourceURL, baseURL) : resourceURL;
                    contentType = (0, mimes_1.getMimeType)(resourceURL);
                    dataURL = void 0;
                    if (!getContentFromUrl) return [3 /*break*/, 2];
                    return [4 /*yield*/, getContentFromUrl(resolvedURL)];
                case 1:
                    content = _a.sent();
                    dataURL = (0, dataurl_1.makeDataUrl)(content, contentType);
                    return [3 /*break*/, 4];
                case 2: return [4 /*yield*/, (0, dataurl_1.resourceToDataURL)(resolvedURL, contentType, options)];
                case 3:
                    dataURL = _a.sent();
                    _a.label = 4;
                case 4: return [2 /*return*/, cssText.replace(toRegex(resourceURL), "$1".concat(dataURL, "$3"))];
                case 5:
                    error_1 = _a.sent();
                    return [3 /*break*/, 6];
                case 6: return [2 /*return*/, cssText];
            }
        });
    });
}
exports.embed = embed;
function filterPreferredFontFormat(str, _a) {
    var preferredFontFormat = _a.preferredFontFormat;
    return !preferredFontFormat
        ? str
        : str.replace(FONT_SRC_REGEX, function (match) {
            // eslint-disable-next-line no-constant-condition
            while (true) {
                var _a = URL_WITH_FORMAT_REGEX.exec(match) || [], src = _a[0], format = _a[2];
                if (!format) {
                    return '';
                }
                if (format === preferredFontFormat) {
                    return "src: ".concat(src, ";");
                }
            }
        });
}
function shouldEmbed(url) {
    return url.search(URL_REGEX) !== -1;
}
exports.shouldEmbed = shouldEmbed;
function embedResources(cssText, baseUrl, options) {
    return __awaiter(this, void 0, void 0, function () {
        var filteredCSSText, urls;
        return __generator(this, function (_a) {
            if (!shouldEmbed(cssText)) {
                return [2 /*return*/, cssText];
            }
            filteredCSSText = filterPreferredFontFormat(cssText, options);
            urls = parseURLs(filteredCSSText);
            return [2 /*return*/, urls.reduce(function (deferred, url) {
                    return deferred.then(function (css) { return embed(css, url, baseUrl, options); });
                }, Promise.resolve(filteredCSSText))];
        });
    });
}
exports.embedResources = embedResources;

},{"./dataurl":7,"./mimes":12,"./util":13}],10:[function(require,module,exports){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.embedWebFonts = exports.getWebFontCSS = void 0;
var util_1 = require("./util");
var dataurl_1 = require("./dataurl");
var embed_resources_1 = require("./embed-resources");
var cssFetchCache = {};
function fetchCSS(url) {
    return __awaiter(this, void 0, void 0, function () {
        var cache, res, cssText;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    cache = cssFetchCache[url];
                    if (cache != null) {
                        return [2 /*return*/, cache];
                    }
                    return [4 /*yield*/, fetch(url)];
                case 1:
                    res = _a.sent();
                    return [4 /*yield*/, res.text()];
                case 2:
                    cssText = _a.sent();
                    cache = { url: url, cssText: cssText };
                    cssFetchCache[url] = cache;
                    return [2 /*return*/, cache];
            }
        });
    });
}
function embedFonts(data, options) {
    return __awaiter(this, void 0, void 0, function () {
        var cssText, regexUrl, fontLocs, loadFonts;
        var _this = this;
        return __generator(this, function (_a) {
            cssText = data.cssText;
            regexUrl = /url\(["']?([^"')]+)["']?\)/g;
            fontLocs = cssText.match(/url\([^)]+\)/g) || [];
            loadFonts = fontLocs.map(function (loc) { return __awaiter(_this, void 0, void 0, function () {
                var url;
                return __generator(this, function (_a) {
                    url = loc.replace(regexUrl, '$1');
                    if (!url.startsWith('https://')) {
                        url = new URL(url, data.url).href;
                    }
                    return [2 /*return*/, (0, dataurl_1.fetchAsDataURL)(url, options.fetchRequestInit, function (_a) {
                            var result = _a.result;
                            cssText = cssText.replace(loc, "url(".concat(result, ")"));
                            return [loc, result];
                        })];
                });
            }); });
            return [2 /*return*/, Promise.all(loadFonts).then(function () { return cssText; })];
        });
    });
}
function parseCSS(source) {
    if (source == null) {
        return [];
    }
    var result = [];
    var commentsRegex = /(\/\*[\s\S]*?\*\/)/gi;
    // strip out comments
    var cssText = source.replace(commentsRegex, '');
    // eslint-disable-next-line prefer-regex-literals
    var keyframesRegex = new RegExp('((@.*?keyframes [\\s\\S]*?){([\\s\\S]*?}\\s*?)})', 'gi');
    // eslint-disable-next-line no-constant-condition
    while (true) {
        var matches = keyframesRegex.exec(cssText);
        if (matches === null) {
            break;
        }
        result.push(matches[0]);
    }
    cssText = cssText.replace(keyframesRegex, '');
    var importRegex = /@import[\s\S]*?url\([^)]*\)[\s\S]*?;/gi;
    // to match css & media queries together
    var combinedCSSRegex = '((\\s*?(?:\\/\\*[\\s\\S]*?\\*\\/)?\\s*?@media[\\s\\S]' +
        '*?){([\\s\\S]*?)}\\s*?})|(([\\s\\S]*?){([\\s\\S]*?)})';
    // unified regex
    var unifiedRegex = new RegExp(combinedCSSRegex, 'gi');
    // eslint-disable-next-line no-constant-condition
    while (true) {
        var matches = importRegex.exec(cssText);
        if (matches === null) {
            matches = unifiedRegex.exec(cssText);
            if (matches === null) {
                break;
            }
            else {
                importRegex.lastIndex = unifiedRegex.lastIndex;
            }
        }
        else {
            unifiedRegex.lastIndex = importRegex.lastIndex;
        }
        result.push(matches[0]);
    }
    return result;
}
function getCSSRules(styleSheets, options) {
    return __awaiter(this, void 0, void 0, function () {
        var ret, deferreds;
        return __generator(this, function (_a) {
            ret = [];
            deferreds = [];
            // First loop inlines imports
            styleSheets.forEach(function (sheet) {
                if ('cssRules' in sheet) {
                    try {
                        (0, util_1.toArray)(sheet.cssRules || []).forEach(function (item, index) {
                            if (item.type === CSSRule.IMPORT_RULE) {
                                var importIndex_1 = index + 1;
                                var url = item.href;
                                var deferred = fetchCSS(url)
                                    .then(function (metadata) { return embedFonts(metadata, options); })
                                    .then(function (cssText) {
                                    return parseCSS(cssText).forEach(function (rule) {
                                        try {
                                            sheet.insertRule(rule, rule.startsWith('@import')
                                                ? (importIndex_1 += 1)
                                                : sheet.cssRules.length);
                                        }
                                        catch (error) {
                                            console.error('Error inserting rule from remote css', {
                                                rule: rule,
                                                error: error,
                                            });
                                        }
                                    });
                                })
                                    .catch(function (e) {
                                    console.error('Error loading remote css', e.toString());
                                });
                                deferreds.push(deferred);
                            }
                        });
                    }
                    catch (e) {
                        var inline_1 = styleSheets.find(function (a) { return a.href == null; }) || document.styleSheets[0];
                        if (sheet.href != null) {
                            deferreds.push(fetchCSS(sheet.href)
                                .then(function (metadata) { return embedFonts(metadata, options); })
                                .then(function (cssText) {
                                return parseCSS(cssText).forEach(function (rule) {
                                    inline_1.insertRule(rule, sheet.cssRules.length);
                                });
                            })
                                .catch(function (err) {
                                console.error('Error loading remote stylesheet', err.toString());
                            }));
                        }
                        console.error('Error inlining remote css file', e.toString());
                    }
                }
            });
            return [2 /*return*/, Promise.all(deferreds).then(function () {
                    // Second loop parses rules
                    styleSheets.forEach(function (sheet) {
                        if ('cssRules' in sheet) {
                            try {
                                (0, util_1.toArray)(sheet.cssRules || []).forEach(function (item) {
                                    ret.push(item);
                                });
                            }
                            catch (e) {
                                console.error("Error while reading CSS rules from ".concat(sheet.href), e.toString());
                            }
                        }
                    });
                    return ret;
                })];
        });
    });
}
function getWebFontRules(cssRules) {
    return cssRules
        .filter(function (rule) { return rule.type === CSSRule.FONT_FACE_RULE; })
        .filter(function (rule) { return (0, embed_resources_1.shouldEmbed)(rule.style.getPropertyValue('src')); });
}
function parseWebFontRules(node, options) {
    return __awaiter(this, void 0, void 0, function () {
        var styleSheets, cssRules;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (node.ownerDocument == null) {
                        throw new Error('Provided element is not within a Document');
                    }
                    styleSheets = (0, util_1.toArray)(node.ownerDocument.styleSheets);
                    return [4 /*yield*/, getCSSRules(styleSheets, options)];
                case 1:
                    cssRules = _a.sent();
                    return [2 /*return*/, getWebFontRules(cssRules)];
            }
        });
    });
}
function getWebFontCSS(node, options) {
    return __awaiter(this, void 0, void 0, function () {
        var rules, cssTexts;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, parseWebFontRules(node, options)];
                case 1:
                    rules = _a.sent();
                    return [4 /*yield*/, Promise.all(rules.map(function (rule) {
                            var baseUrl = rule.parentStyleSheet ? rule.parentStyleSheet.href : null;
                            return (0, embed_resources_1.embedResources)(rule.cssText, baseUrl, options);
                        }))];
                case 2:
                    cssTexts = _a.sent();
                    return [2 /*return*/, cssTexts.join('\n')];
            }
        });
    });
}
exports.getWebFontCSS = getWebFontCSS;
function embedWebFonts(clonedNode, options) {
    return __awaiter(this, void 0, void 0, function () {
        var cssText, _a, _b, styleNode, sytleContent;
        return __generator(this, function (_c) {
            switch (_c.label) {
                case 0:
                    if (!(options.fontEmbedCSS != null)) return [3 /*break*/, 1];
                    _a = options.fontEmbedCSS;
                    return [3 /*break*/, 5];
                case 1:
                    if (!options.skipFonts) return [3 /*break*/, 2];
                    _b = null;
                    return [3 /*break*/, 4];
                case 2: return [4 /*yield*/, getWebFontCSS(clonedNode, options)];
                case 3:
                    _b = _c.sent();
                    _c.label = 4;
                case 4:
                    _a = _b;
                    _c.label = 5;
                case 5:
                    cssText = _a;
                    if (cssText) {
                        styleNode = document.createElement('style');
                        sytleContent = document.createTextNode(cssText);
                        styleNode.appendChild(sytleContent);
                        if (clonedNode.firstChild) {
                            clonedNode.insertBefore(styleNode, clonedNode.firstChild);
                        }
                        else {
                            clonedNode.appendChild(styleNode);
                        }
                    }
                    return [2 /*return*/];
            }
        });
    });
}
exports.embedWebFonts = embedWebFonts;

},{"./dataurl":7,"./embed-resources":9,"./util":13}],11:[function(require,module,exports){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getFontEmbedCSS = exports.toBlob = exports.toJpeg = exports.toPng = exports.toPixelData = exports.toCanvas = exports.toSvg = void 0;
var clone_node_1 = require("./clone-node");
var embed_images_1 = require("./embed-images");
var apply_style_1 = require("./apply-style");
var embed_webfonts_1 = require("./embed-webfonts");
var util_1 = require("./util");
function toSvg(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var _a, width, height, clonedNode, datauri;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0:
                    _a = (0, util_1.getImageSize)(node, options), width = _a.width, height = _a.height;
                    return [4 /*yield*/, (0, clone_node_1.cloneNode)(node, options, true)];
                case 1:
                    clonedNode = (_b.sent());
                    return [4 /*yield*/, (0, embed_webfonts_1.embedWebFonts)(clonedNode, options)];
                case 2:
                    _b.sent();
                    return [4 /*yield*/, (0, embed_images_1.embedImages)(clonedNode, options)];
                case 3:
                    _b.sent();
                    (0, apply_style_1.applyStyle)(clonedNode, options);
                    return [4 /*yield*/, (0, util_1.nodeToDataURL)(clonedNode, width, height)];
                case 4:
                    datauri = _b.sent();
                    return [2 /*return*/, datauri];
            }
        });
    });
}
exports.toSvg = toSvg;
function toCanvas(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var _a, width, height, svg, img, canvas, context, ratio, canvasWidth, canvasHeight;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0:
                    _a = (0, util_1.getImageSize)(node, options), width = _a.width, height = _a.height;
                    return [4 /*yield*/, toSvg(node, options)];
                case 1:
                    svg = _b.sent();
                    return [4 /*yield*/, (0, util_1.createImage)(svg)];
                case 2:
                    img = _b.sent();
                    canvas = document.createElement('canvas');
                    context = canvas.getContext('2d');
                    ratio = options.pixelRatio || (0, util_1.getPixelRatio)();
                    canvasWidth = options.canvasWidth || width;
                    canvasHeight = options.canvasHeight || height;
                    canvas.width = canvasWidth * ratio;
                    canvas.height = canvasHeight * ratio;
                    if (!options.skipAutoScale) {
                        (0, util_1.checkCanvasDimensions)(canvas);
                    }
                    canvas.style.width = "".concat(canvasWidth);
                    canvas.style.height = "".concat(canvasHeight);
                    if (options.backgroundColor) {
                        context.fillStyle = options.backgroundColor;
                        context.fillRect(0, 0, canvas.width, canvas.height);
                    }
                    context.drawImage(img, 0, 0, canvas.width, canvas.height);
                    return [2 /*return*/, canvas];
            }
        });
    });
}
exports.toCanvas = toCanvas;
function toPixelData(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var _a, width, height, canvas, ctx;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0:
                    _a = (0, util_1.getImageSize)(node, options), width = _a.width, height = _a.height;
                    return [4 /*yield*/, toCanvas(node, options)];
                case 1:
                    canvas = _b.sent();
                    ctx = canvas.getContext('2d');
                    return [2 /*return*/, ctx.getImageData(0, 0, width, height).data];
            }
        });
    });
}
exports.toPixelData = toPixelData;
function toPng(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var canvas;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, toCanvas(node, options)];
                case 1:
                    canvas = _a.sent();
                    return [2 /*return*/, canvas.toDataURL()];
            }
        });
    });
}
exports.toPng = toPng;
function toJpeg(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var canvas;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, toCanvas(node, options)];
                case 1:
                    canvas = _a.sent();
                    return [2 /*return*/, canvas.toDataURL('image/jpeg', options.quality || 1)];
            }
        });
    });
}
exports.toJpeg = toJpeg;
function toBlob(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var canvas, blob;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, toCanvas(node, options)];
                case 1:
                    canvas = _a.sent();
                    return [4 /*yield*/, (0, util_1.canvasToBlob)(canvas)];
                case 2:
                    blob = _a.sent();
                    return [2 /*return*/, blob];
            }
        });
    });
}
exports.toBlob = toBlob;
function getFontEmbedCSS(node, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, (0, embed_webfonts_1.getWebFontCSS)(node, options)];
        });
    });
}
exports.getFontEmbedCSS = getFontEmbedCSS;

},{"./apply-style":4,"./clone-node":5,"./embed-images":8,"./embed-webfonts":10,"./util":13}],12:[function(require,module,exports){
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getMimeType = void 0;
var WOFF = 'application/font-woff';
var JPEG = 'image/jpeg';
var mimes = {
    woff: WOFF,
    woff2: WOFF,
    ttf: 'application/font-truetype',
    eot: 'application/vnd.ms-fontobject',
    png: 'image/png',
    jpg: JPEG,
    jpeg: JPEG,
    gif: 'image/gif',
    tiff: 'image/tiff',
    svg: 'image/svg+xml',
};
function getExtension(url) {
    var match = /\.([^./]*?)$/g.exec(url);
    return match ? match[1] : '';
}
function getMimeType(url) {
    var extension = getExtension(url).toLowerCase();
    return mimes[extension] || '';
}
exports.getMimeType = getMimeType;

},{}],13:[function(require,module,exports){
(function (process){(function (){
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.nodeToDataURL = exports.svgToDataURL = exports.createImage = exports.canvasToBlob = exports.checkCanvasDimensions = exports.getPixelRatio = exports.getImageSize = exports.toArray = exports.delay = exports.uuid = exports.resolveUrl = void 0;
function resolveUrl(url, baseUrl) {
    // url is absolute already
    if (url.match(/^[a-z]+:\/\//i)) {
        return url;
    }
    // url is absolute already, without protocol
    if (url.match(/^\/\//)) {
        return window.location.protocol + url;
    }
    // dataURI, mailto:, tel:, etc.
    if (url.match(/^[a-z]+:/i)) {
        return url;
    }
    var doc = document.implementation.createHTMLDocument();
    var base = doc.createElement('base');
    var a = doc.createElement('a');
    doc.head.appendChild(base);
    doc.body.appendChild(a);
    if (baseUrl) {
        base.href = baseUrl;
    }
    a.href = url;
    return a.href;
}
exports.resolveUrl = resolveUrl;
exports.uuid = (function () {
    // generate uuid for className of pseudo elements.
    // We should not use GUIDs, otherwise pseudo elements sometimes cannot be captured.
    var counter = 0;
    // ref: http://stackoverflow.com/a/6248722/2519373
    var random = function () {
        // eslint-disable-next-line no-bitwise
        return "0000".concat(((Math.random() * Math.pow(36, 4)) << 0).toString(36)).slice(-4);
    };
    return function () {
        counter += 1;
        return "u".concat(random()).concat(counter);
    };
})();
function delay(ms) {
    return function (args) {
        return new Promise(function (resolve) {
            setTimeout(function () { return resolve(args); }, ms);
        });
    };
}
exports.delay = delay;
function toArray(arrayLike) {
    var arr = [];
    for (var i = 0, l = arrayLike.length; i < l; i++) {
        arr.push(arrayLike[i]);
    }
    return arr;
}
exports.toArray = toArray;
function px(node, styleProperty) {
    var win = node.ownerDocument.defaultView || window;
    var val = win.getComputedStyle(node).getPropertyValue(styleProperty);
    return val ? parseFloat(val.replace('px', '')) : 0;
}
function getNodeWidth(node) {
    var leftBorder = px(node, 'border-left-width');
    var rightBorder = px(node, 'border-right-width');
    return node.clientWidth + leftBorder + rightBorder;
}
function getNodeHeight(node) {
    var topBorder = px(node, 'border-top-width');
    var bottomBorder = px(node, 'border-bottom-width');
    return node.clientHeight + topBorder + bottomBorder;
}
function getImageSize(targetNode, options) {
    if (options === void 0) { options = {}; }
    var width = options.width || getNodeWidth(targetNode);
    var height = options.height || getNodeHeight(targetNode);
    return { width: width, height: height };
}
exports.getImageSize = getImageSize;
function getPixelRatio() {
    var ratio;
    var FINAL_PROCESS;
    try {
        FINAL_PROCESS = process;
    }
    catch (e) {
        // pass
    }
    var val = FINAL_PROCESS && FINAL_PROCESS.env
        ? FINAL_PROCESS.env.devicePixelRatio
        : null;
    if (val) {
        ratio = parseInt(val, 10);
        if (Number.isNaN(ratio)) {
            ratio = 1;
        }
    }
    return ratio || window.devicePixelRatio || 1;
}
exports.getPixelRatio = getPixelRatio;
// @see https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas#maximum_canvas_size
var canvasDimensionLimit = 16384;
function checkCanvasDimensions(canvas) {
    if (canvas.width > canvasDimensionLimit ||
        canvas.height > canvasDimensionLimit) {
        if (canvas.width > canvasDimensionLimit &&
            canvas.height > canvasDimensionLimit) {
            if (canvas.width > canvas.height) {
                canvas.height *= canvasDimensionLimit / canvas.width;
                canvas.width = canvasDimensionLimit;
            }
            else {
                canvas.width *= canvasDimensionLimit / canvas.height;
                canvas.height = canvasDimensionLimit;
            }
        }
        else if (canvas.width > canvasDimensionLimit) {
            canvas.height *= canvasDimensionLimit / canvas.width;
            canvas.width = canvasDimensionLimit;
        }
        else {
            canvas.width *= canvasDimensionLimit / canvas.height;
            canvas.height = canvasDimensionLimit;
        }
    }
}
exports.checkCanvasDimensions = checkCanvasDimensions;
function canvasToBlob(canvas, options) {
    if (options === void 0) { options = {}; }
    if (canvas.toBlob) {
        return new Promise(function (resolve) {
            canvas.toBlob(resolve, options.type ? options.type : 'image/png', options.quality ? options.quality : 1);
        });
    }
    return new Promise(function (resolve) {
        var binaryString = window.atob(canvas
            .toDataURL(options.type ? options.type : undefined, options.quality ? options.quality : undefined)
            .split(',')[1]);
        var len = binaryString.length;
        var binaryArray = new Uint8Array(len);
        for (var i = 0; i < len; i += 1) {
            binaryArray[i] = binaryString.charCodeAt(i);
        }
        resolve(new Blob([binaryArray], {
            type: options.type ? options.type : 'image/png',
        }));
    });
}
exports.canvasToBlob = canvasToBlob;
function createImage(url) {
    return new Promise(function (resolve, reject) {
        var img = new Image();
        img.onload = function () { return resolve(img); };
        img.onerror = reject;
        img.crossOrigin = 'anonymous';
        img.decoding = 'sync';
        img.src = url;
    });
}
exports.createImage = createImage;
function svgToDataURL(svg) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, Promise.resolve()
                    .then(function () { return new XMLSerializer().serializeToString(svg); })
                    .then(encodeURIComponent)
                    .then(function (html) { return "data:image/svg+xml;charset=utf-8,".concat(html); })];
        });
    });
}
exports.svgToDataURL = svgToDataURL;
function nodeToDataURL(node, width, height) {
    return __awaiter(this, void 0, void 0, function () {
        var xmlns, svg, foreignObject;
        return __generator(this, function (_a) {
            xmlns = 'http://www.w3.org/2000/svg';
            svg = document.createElementNS(xmlns, 'svg');
            foreignObject = document.createElementNS(xmlns, 'foreignObject');
            svg.setAttribute('width', "".concat(width));
            svg.setAttribute('height', "".concat(height));
            svg.setAttribute('viewBox', "0 0 ".concat(width, " ").concat(height));
            foreignObject.setAttribute('width', '100%');
            foreignObject.setAttribute('height', '100%');
            foreignObject.setAttribute('x', '0');
            foreignObject.setAttribute('y', '0');
            foreignObject.setAttribute('externalResourcesRequired', 'true');
            svg.appendChild(foreignObject);
            foreignObject.appendChild(node);
            return [2 /*return*/, svgToDataURL(svg)];
        });
    });
}
exports.nodeToDataURL = nodeToDataURL;

}).call(this)}).call(this,require('_process'))
},{"_process":1}]},{},[2]);
