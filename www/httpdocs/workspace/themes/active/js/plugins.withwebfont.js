window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};
(function(a){function b(){}for(var c="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());


//--------------------------------------------

/*
 * jQuery Color Animations v@VERSION
 * http://jquery.org/
 *
 * Copyright 2011 John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Date: @DATE
 */

(function( jQuery, undefined ){
	var stepHooks = "backgroundColor borderBottomColor borderLeftColor borderRightColor borderTopColor color outlineColor".split(" "),

		// plusequals test for += 100 -= 100
		rplusequals = /^([\-+])=\s*(\d+\.?\d*)/,
		// a set of RE's that can match strings and generate color tuples.
		stringParsers = [{
				re: /rgba?\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*(?:,\s*(\d+(?:\.\d+)?)\s*)?\)/,
				parse: function( execResult ) {
					return [
						execResult[ 1 ],
						execResult[ 2 ],
						execResult[ 3 ],
						execResult[ 4 ]
					];
				}
			}, {
				re: /rgba?\(\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d+(?:\.\d+)?)\s*)?\)/,
				parse: function( execResult ) {
					return [
						2.55 * execResult[1],
						2.55 * execResult[2],
						2.55 * execResult[3],
						execResult[ 4 ]
					];
				}
			}, {
				re: /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/,
				parse: function( execResult ) {
					return [
						parseInt( execResult[ 1 ], 16 ),
						parseInt( execResult[ 2 ], 16 ),
						parseInt( execResult[ 3 ], 16 )
					];
				}
			}, {
				re: /#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/,
				parse: function( execResult ) {
					return [
						parseInt( execResult[ 1 ] + execResult[ 1 ], 16 ),
						parseInt( execResult[ 2 ] + execResult[ 2 ], 16 ),
						parseInt( execResult[ 3 ] + execResult[ 3 ], 16 )
					];
				}
			}, {
				re: /hsla?\(\s*(\d+(?:\.\d+)?)\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d+(?:\.\d+)?)\s*)?\)/,
				space: "hsla",
				parse: function( execResult ) {
					return [
						execResult[1],
						execResult[2] / 100,
						execResult[3] / 100,
						execResult[4]
					];
				}
			}],

		// jQuery.Color( )
		color = jQuery.Color = function( color, green, blue, alpha ) {
			return new jQuery.Color.fn.parse( color, green, blue, alpha );
		},
		spaces = {
			rgba: {
				cache: "_rgba",
				props: {
					red: {
						idx: 0,
						type: "byte",
						empty: true
					},
					green: {
						idx: 1,
						type: "byte",
						empty: true
					},
					blue: {
						idx: 2,
						type: "byte",
						empty: true
					},
					alpha: {
						idx: 3,
						type: "percent",
						def: 1
					}
				}
			},
			hsla: {
				cache: "_hsla",
				props: {
					hue: {
						idx: 0,
						type: "degrees",
						empty: true
					},
					saturation: {
						idx: 1,
						type: "percent",
						empty: true
					},
					lightness: {
						idx: 2,
						type: "percent",
						empty: true
					}
				}
			}
		},
		propTypes = {
			"byte": {
				floor: true,
				min: 0,
				max: 255
			},
			"percent": {
				min: 0,
				max: 1
			},
			"degrees": {
				mod: 360,
				floor: true
			}
		},
		rgbaspace = spaces.rgba.props,
		support = color.support = {},

		// colors = jQuery.Color.names
		colors,

		// local aliases of functions called often
		each = jQuery.each;

	spaces.hsla.props.alpha = rgbaspace.alpha;

	function clamp( value, prop, alwaysAllowEmpty ) {
		var type = propTypes[ prop.type ] || {},
			allowEmpty = prop.empty || alwaysAllowEmpty;

		if ( allowEmpty && value == null ) {
			return null;
		}
		if ( prop.def && value == null ) {
			return prop.def;
		}
		if ( type.floor ) {
			value = ~~value;
		} else {
			value = parseFloat( value );
		}
		if ( value == null || isNaN( value ) ) {
			return prop.def;
		}
		if ( type.mod ) {
			value = value % type.mod;
			// -10 -> 350
			return value < 0 ? type.mod + value : value;
		}

		// for now all property types without mod have min and max
		return type.min > value ? type.min : type.max < value ? type.max : value;
	}

	color.fn = color.prototype = {
		constructor: color,
		parse: function( red, green, blue, alpha ) {
			if ( red === undefined ) {
				this._rgba = [ null, null, null, null ];
				return this;
			}
			if ( red instanceof jQuery || red.nodeType ) {
				red = red instanceof jQuery ? red.css( green ) : jQuery( red ).css( green );
				green = undefined;
			}

			var inst = this,
				type = jQuery.type( red ),
				rgba = this._rgba = [],
				source;

			// more than 1 argument specified - assume ( red, green, blue, alpha )
			if ( green !== undefined ) {
				red = [ red, green, blue, alpha ];
				type = "array";
			}

			if ( type === "string" ) {
				red = red.toLowerCase();
				each( stringParsers, function( i, parser ) {
					var match = parser.re.exec( red ),
						values = match && parser.parse( match ),
						parsed,
						spaceName = parser.space || "rgba",
						cache = spaces[ spaceName ].cache;


					if ( values ) {
						parsed = inst[ spaceName ]( values );

						// if this was an rgba parse the assignment might happen twice
						// oh well....
						inst[ cache ] = parsed[ cache ];
						rgba = inst._rgba = parsed._rgba;

						// exit each( stringParsers ) here because we matched
						return false;
					}
				});

				// Found a stringParser that handled it
				if ( rgba.length !== 0 ) {

					// if this came from a parsed string, force "transparent" when alpha is 0
					// chrome, (and maybe others) return "transparent" as rgba(0,0,0,0)
					if ( Math.max.apply( Math, rgba ) === 0 ) {
						jQuery.extend( rgba, colors.transparent );
					}
					return this;
				}

				// named colors / default - filter back through parse function
				red = colors[ red ] || colors._default;
				return this.parse( red );
			}

			if ( type === "array" ) {
				each( rgbaspace, function( key, prop ) {
					rgba[ prop.idx ] = clamp( red[ prop.idx ], prop );
				});
				return this;
			}

			if ( type === "object" ) {
				if ( red instanceof color ) {
					each( spaces, function( spaceName, space ) {
						if ( red[ space.cache ] ) {
							inst[ space.cache ] = red[ space.cache ].slice();
						}
					});
				} else {
					each( spaces, function( spaceName, space ) {
						each( space.props, function( key, prop ) {
							var cache = space.cache;

							// if the cache doesn't exist, and we know how to convert
							if ( !inst[ cache ] && space.to ) {

								// if the value was null, we don't need to copy it
								// if the key was alpha, we don't need to copy it either
								if ( red[ key ] == null || key === "alpha") {
									return;
								}
								inst[ cache ] = space.to( inst._rgba );
							}

							// this is the only case where we allow nulls for ALL properties.
							// call clamp with alwaysAllowEmpty
							inst[ cache ][ prop.idx ] = clamp( red[ key ], prop, true );
						});
					});
				}
				return this;
			}
		},
		is: function( compare ) {
			var is = color( compare ),
				same = true,
				myself = this;

			each( spaces, function( _, space ) {
				var isCache = is[ space.cache ],
					localCache;
				if (isCache) {
					localCache = myself[ space.cache ] || space.to && space.to( myself._rgba ) || [];
					each( space.props, function( _, prop ) {
						if ( isCache[ prop.idx ] != null ) {
							same = ( isCache[ prop.idx ] == localCache[ prop.idx ] );
							return same;
						}
					});
				}
				return same;
			});
			return same;
		},
		_space: function() {
			var used = [],
				inst = this;
			each( spaces, function( spaceName, space ) {
				if ( inst[ space.cache ] ) {
					used.push( spaceName );
				}
			});
			return used.pop();
		},
		transition: function( other, distance ) {
			var end = color( other ),
				spaceName = end._space(),
				space = spaces[ spaceName ],
				start = this[ space.cache ] || space.to( this._rgba ),
				result = start.slice();

			end = end[ space.cache ];
			each( space.props, function( key, prop ) {
				var index = prop.idx,
					startValue = start[ index ],
					endValue = end[ index ],
					type = propTypes[ prop.type ] || {};

				// if null, don't override start value
				if ( endValue === null ) {
					return;
				}
				// if null - use end
				if ( startValue === null ) {
					result[ index ] = endValue;
				} else {
					if ( type.mod ) {
						if ( endValue - startValue > type.mod / 2 ) {
							startValue += type.mod;
						} else if ( startValue - endValue > type.mod / 2 ) {
							startValue -= type.mod;
						}
					}
					result[ prop.idx ] = clamp( ( endValue - startValue ) * distance + startValue, prop );
				}
			});
			return this[ spaceName ]( result );
		},
		blend: function( opaque ) {
			// if we are already opaque - return ourself
			if ( this._rgba[ 3 ] === 1 ) {
				return this;
			}

			var rgb = this._rgba.slice(),
				a = rgb.pop(),
				blend = color( opaque )._rgba;

			return color( jQuery.map( rgb, function( v, i ) {
				return ( 1 - a ) * blend[ i ] + a * v;
			}));
		},
		toRgbaString: function() {
			var prefix = "rgba(",
				rgba = jQuery.map( this._rgba, function( v, i ) {
					return v == null ? ( i > 2 ? 1 : 0 ) : v;
				});

			if ( rgba[ 3 ] === 1 ) {
				rgba.pop();
				prefix = "rgb(";
			}

			return prefix + rgba.join(",") + ")";
		},
		toHslaString: function() {
			var prefix = "hsla(",
				hsla = jQuery.map( this.hsla(), function( v, i ) {
					if ( v == null ) {
						v = i > 2 ? 1 : 0;
					}

					// catch 1 and 2
					if ( i && i < 3 ) {
						v = Math.round( v * 100 ) + "%";
					}
					return v;
				});

			if ( hsla[ 3 ] == 1 ) {
				hsla.pop();
				prefix = "hsl(";
			}
			return prefix + hsla.join(",") + ")";
		},
		toHexString: function( includeAlpha ) {
			var rgba = this._rgba.slice(),
				alpha = rgba.pop();

			if ( includeAlpha ) {
				rgba.push( ~~( alpha * 255 ) );
			}

			return "#" + jQuery.map( rgba, function( v, i ) {

				// default to 0 when nulls exist
				v = ( v || 0 ).toString( 16 );
				return v.length == 1 ? "0" + v : v;
			}).join("");
		},
		toString: function() {
			return this._rgba[ 3 ] === 0 ? "transparent" : this.toRgbaString();
		}
	};
	color.fn.parse.prototype = color.fn;

	// hsla conversions adapted from:
	// http://www.google.com/codesearch/p#OAMlx_jo-ck/src/third_party/WebKit/Source/WebCore/inspector/front-end/Color.js&d=7&l=193

	function hue2rgb( p, q, h ) {
		h = ( h + 1 ) % 1;
		if ( h * 6 < 1 ) {
			return p + (q - p) * 6 * h;
		}
		if ( h * 2 < 1) {
			return q;
		}
		if ( h * 3 < 2 ) {
			return p + (q - p) * ((2/3) - h) * 6;
		}
		return p;
	}

	spaces.hsla.to = function ( rgba ) {
		if ( rgba[ 0 ] == null || rgba[ 1 ] == null || rgba[ 2 ] == null ) {
			return [ null, null, null, rgba[ 3 ] ];
		}
		var r = rgba[ 0 ] / 255,
			g = rgba[ 1 ] / 255,
			b = rgba[ 2 ] / 255,
			a = rgba[ 3 ],
			max = Math.max( r, g, b ),
			min = Math.min( r, g, b ),
			diff = max - min,
			add = max + min,
			l = add * 0.5,
			h, s;

		if ( min === max ) {
			h = 0;
		} else if ( r === max ) {
			h = ( 60 * ( g - b ) / diff ) + 360;
		} else if ( g === max ) {
			h = ( 60 * ( b - r ) / diff ) + 120;
		} else {
			h = ( 60 * ( r - g ) / diff ) + 240;
		}

		if ( l === 0 || l === 1 ) {
			s = l;
		} else if ( l <= 0.5 ) {
			s = diff / add;
		} else {
			s = diff / ( 2 - add );
		}
		return [ Math.round(h) % 360, s, l, a == null ? 1 : a ];
	};

	spaces.hsla.from = function ( hsla ) {
		if ( hsla[ 0 ] == null || hsla[ 1 ] == null || hsla[ 2 ] == null ) {
			return [ null, null, null, hsla[ 3 ] ];
		}
		var h = hsla[ 0 ] / 360,
			s = hsla[ 1 ],
			l = hsla[ 2 ],
			a = hsla[ 3 ],
			q = l <= 0.5 ? l * ( 1 + s ) : l + s - l * s,
			p = 2 * l - q,
			r, g, b;

		return [
			Math.round( hue2rgb( p, q, h + ( 1 / 3 ) ) * 255 ),
			Math.round( hue2rgb( p, q, h ) * 255 ),
			Math.round( hue2rgb( p, q, h - ( 1 / 3 ) ) * 255 ),
			a
		];
	};


	each( spaces, function( spaceName, space ) {
		var props = space.props,
			cache = space.cache,
			to = space.to,
			from = space.from;

		// makes rgba() and hsla()
		color.fn[ spaceName ] = function( value ) {

			// generate a cache for this space if it doesn't exist
			if ( to && !this[ cache ] ) {
				this[ cache ] = to( this._rgba );
			}
			if ( value === undefined ) {
				return this[ cache ].slice();
			}

			var type = jQuery.type( value ),
				arr = ( type === "array" || type === "object" ) ? value : arguments,
				local = this[ cache ].slice(),
				ret;

			each( props, function( key, prop ) {
				var val = arr[ type === "object" ? key : prop.idx ];
				if ( val == null ) {
					val = local[ prop.idx ];
				}
				local[ prop.idx ] = clamp( val, prop );
			});

			if ( from ) {
				ret = color( from( local ) );
				ret[ cache ] = local;
				return ret;
			} else {
				return color( local );
			}
		};

		// makes red() green() blue() alpha() hue() saturation() lightness()
		each( props, function( key, prop ) {
			// alpha is included in more than one space
			if ( color.fn[ key ] ) {
				return;
			}
			color.fn[ key ] = function( value ) {
				var vtype = jQuery.type( value ),
					fn = ( key === 'alpha' ? ( this._hsla ? 'hsla' : 'rgba' ) : spaceName ),
					local = this[ fn ](),
					cur = local[ prop.idx ],
					match;

				if ( vtype === "undefined" ) {
					return cur;
				}

				if ( vtype === "function" ) {
					value = value.call( this, cur );
					vtype = jQuery.type( value );
				}
				if ( value == null && prop.empty ) {
					return this;
				}
				if ( vtype === "string" ) {
					match = rplusequals.exec( value );
					if ( match ) {
						value = cur + parseFloat( match[ 2 ] ) * ( match[ 1 ] === "+" ? 1 : -1 );
					}
				}
				local[ prop.idx ] = value;
				return this[ fn ]( local );
			};
		});
	});

	// add .fx.step functions
	each( stepHooks, function( i, hook ) {
		jQuery.cssHooks[ hook ] = {
			set: function( elem, value ) {
				value = color( value );
				if ( !support.rgba && value._rgba[ 3 ] !== 1 ) {
					var backgroundColor,
						curElem = hook === "backgroundColor" ? elem.parentNode : elem;
					do {
						backgroundColor = jQuery.curCSS( curElem, "backgroundColor" );
					} while (
						( backgroundColor === "" || backgroundColor === "transparent" ) &&
						( curElem = curElem.parentNode ) &&
						curElem.style
					);

					value = value.blend( backgroundColor && backgroundColor !== "transparent" ?
						backgroundColor :
						"_default" );
				}

				value = value.toRgbaString();

				elem.style[ hook ] = value;
			}
		};
		jQuery.fx.step[ hook ] = function( fx ) {
			if ( !fx.colorInit ) {
				fx.start = color( fx.elem, hook );
				fx.end = color( fx.end );
				fx.colorInit = true;
			}
			jQuery.cssHooks[ hook ].set( fx.elem, fx.start.transition( fx.end, fx.pos ) );
		};
	});

	// detect rgba support
	jQuery(function() {
		var div = document.createElement( "div" ),
			div_style = div.style;

		div_style.cssText = "background-color:rgba(1,1,1,.5)";
		support.rgba = div_style.backgroundColor.indexOf( "rgba" ) > -1;
	});

	// Some named colors to work with
	// From Interface by Stefan Petre
	// http://interface.eyecon.ro/
	colors = jQuery.Color.names = {
		aqua: "#00ffff",
		azure: "#f0ffff",
		beige: "#f5f5dc",
		black: "#000000",
		blue: "#0000ff",
		brown: "#a52a2a",
		cyan: "#00ffff",
		darkblue: "#00008b",
		darkcyan: "#008b8b",
		darkgrey: "#a9a9a9",
		darkgreen: "#006400",
		darkkhaki: "#bdb76b",
		darkmagenta: "#8b008b",
		darkolivegreen: "#556b2f",
		darkorange: "#ff8c00",
		darkorchid: "#9932cc",
		darkred: "#8b0000",
		darksalmon: "#e9967a",
		darkviolet: "#9400d3",
		fuchsia: "#ff00ff",
		gold: "#ffd700",
		green: "#008000",
		indigo: "#4b0082",
		khaki: "#f0e68c",
		lightblue: "#add8e6",
		lightcyan: "#e0ffff",
		lightgreen: "#90ee90",
		lightgrey: "#d3d3d3",
		lightpink: "#ffb6c1",
		lightyellow: "#ffffe0",
		lime: "#00ff00",
		magenta: "#ff00ff",
		maroon: "#800000",
		navy: "#000080",
		olive: "#808000",
		orange: "#ffa500",
		pink: "#ffc0cb",
		purple: "#800080",
		violet: "#800080",
		red: "#ff0000",
		silver: "#c0c0c0",
		white: "#ffffff",
		yellow: "#ffff00",
		transparent: [ null, null, null, 0 ],
		_default: "#ffffff"
	};
})( jQuery );


//-------------------------------------------------


/*!
 * jQuery Cookie Plugin
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
(function($) {
    $.cookie = function(key, value, options) {

        // key and at least value given, set cookie...
        if (arguments.length > 1 && (!/Object/.test(Object.prototype.toString.call(value)) || value === null || value === undefined)) {
            options = $.extend({}, options);

            if (value === null || value === undefined) {
                options.expires = -1;
            }

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setDate(t.getDate() + days);
            }

            value = String(value);

            return (document.cookie = [
                encodeURIComponent(key), '=', options.raw ? value : encodeURIComponent(value),
                options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
                options.path    ? '; path=' + options.path : '',
                options.domain  ? '; domain=' + options.domain : '',
                options.secure  ? '; secure' : ''
            ].join(''));
        }

        // key and possibly options given, get cookie...
        options = value || {};
        var decode = options.raw ? function(s) { return s; } : decodeURIComponent;

        var pairs = document.cookie.split('; ');
        for (var i = 0, pair; pair = pairs[i] && pairs[i].split('='); i++) {
            if (decode(pair[0]) === key) return decode(pair[1] || ''); // IE saves cookies with empty string as "c; ", e.g. without "=" as opposed to EOMB, thus pair[1] may be undefined
        }
        return null;
    };
})(jQuery);

/* webfont */

/*
 * Copyright 2012 Small Batch, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
;(function(window,document,undefined){
var h=void 0,i=!0,l=null,o=!1;function p(a){return function(){return this[a]}}var q;function s(a,c,b){var d=2<arguments.length?Array.prototype.slice.call(arguments,2):[];return function(){d.push.apply(d,arguments);return c.apply(a,d)}};function t(a){this.F=a;this.U=h}t.prototype.createElement=function(a,c,b){a=this.F.createElement(a);if(c)for(var d in c)c.hasOwnProperty(d)&&("style"==d?u(this,a,c[d]):a.setAttribute(d,c[d]));b&&a.appendChild(this.F.createTextNode(b));return a};function v(a,c,b){a=a.F.getElementsByTagName(c)[0];a||(a=document.documentElement);a&&a.lastChild&&a.insertBefore(b,a.lastChild)}function aa(a){function c(){document.body?a():setTimeout(c,0)}c()}function w(a){a.parentNode&&a.parentNode.removeChild(a)}
function x(a,c){return a.createElement("link",{rel:"stylesheet",href:c})}function y(a,c){return a.createElement("script",{src:c})}function z(a,c){for(var b=a.className.split(/\s+/),d=0,e=b.length;d<e;d++)if(b[d]==c)return;b.push(c);a.className=b.join(" ").replace(/^\s+/,"")}function A(a,c){for(var b=a.className.split(/\s+/),d=[],e=0,g=b.length;e<g;e++)b[e]!=c&&d.push(b[e]);a.className=d.join(" ").replace(/^\s+/,"").replace(/\s+$/,"")}
function ba(a,c){for(var b=a.className.split(/\s+/),d=0,e=b.length;d<e;d++)if(b[d]==c)return i;return o}function u(a,c,b){if(a.U===h){var d=a.F.createElement("p");d.innerHTML='<a style="top:1px;">w</a>';a.U=/top/.test(d.getElementsByTagName("a")[0].getAttribute("style"))}a.U?c.setAttribute("style",b):c.style.cssText=b};function B(a,c,b,d,e,g,f,k){this.za=a;this.Fa=c;this.na=b;this.ma=d;this.Ca=e;this.Ba=g;this.la=f;this.Ga=k}q=B.prototype;q.getName=p("za");q.va=p("Fa");q.X=p("na");q.sa=p("ma");q.ta=p("Ca");q.ua=p("Ba");q.ra=p("la");q.w=p("Ga");function C(a,c){this.a=a;this.k=c}var ca=new B("Unknown","Unknown","Unknown","Unknown","Unknown","Unknown",h,o);
C.prototype.parse=function(){var a;if(-1!=this.a.indexOf("MSIE"))if(a=E(this.a,/(MSIE [\d\w\.]+)/,1),""!=a){var c=a.split(" ");a=c[0];c=c[1];a=new B(a,c,a,c,F(this),G(this),H(this.k),6<=I(c))}else a=new B("MSIE","Unknown","MSIE","Unknown",F(this),G(this),H(this.k),o);else if(-1!=this.a.indexOf("Opera"))a:{var c=a="Unknown",b=E(this.a,/(Presto\/[\d\w\.]+)/,1);""!=b?(c=b.split("/"),a=c[0],c=c[1]):(-1!=this.a.indexOf("Gecko")&&(a="Gecko"),b=E(this.a,/rv:([^\)]+)/,1),""!=b&&(c=b));if(-1!=this.a.indexOf("Version/")&&
(b=E(this.a,/Version\/([\d\.]+)/,1),""!=b)){a=new B("Opera",b,a,c,F(this),G(this),H(this.k),10<=I(b));break a}b=E(this.a,/Opera[\/ ]([\d\.]+)/,1);a=""!=b?new B("Opera",b,a,c,F(this),G(this),H(this.k),10<=I(b)):new B("Opera","Unknown",a,c,F(this),G(this),H(this.k),o)}else if(-1!=this.a.indexOf("AppleWebKit")){a=F(this);c=G(this);b=E(this.a,/AppleWebKit\/([\d\.\+]+)/,1);""==b&&(b="Unknown");var d="Unknown";-1!=this.a.indexOf("Chrome")||-1!=this.a.indexOf("CrMo")?d="Chrome":-1!=this.a.indexOf("Safari")?
d="Safari":-1!=this.a.indexOf("AdobeAIR")&&(d="AdobeAIR");var e="Unknown";-1!=this.a.indexOf("Version/")?e=E(this.a,/Version\/([\d\.\w]+)/,1):"Chrome"==d?e=E(this.a,/(Chrome|CrMo)\/([\d\.]+)/,2):"AdobeAIR"==d&&(e=E(this.a,/AdobeAIR\/([\d\.]+)/,1));var g=o;"AdobeAIR"==d?(g=E(e,/\d+\.(\d+)/,1),g=2<I(e)||2==I(e)&&5<=parseInt(g,10)):(g=E(b,/\d+\.(\d+)/,1),g=526<=I(b)||525<=I(b)&&13<=parseInt(g,10));a=new B(d,e,"AppleWebKit",b,a,c,H(this.k),g)}else-1!=this.a.indexOf("Gecko")?(c=a="Unknown",d=o,-1!=this.a.indexOf("Firefox")?
(a="Firefox",b=E(this.a,/Firefox\/([\d\w\.]+)/,1),""!=b&&(d=E(b,/\d+\.(\d+)/,1),c=b,d=""!=b&&3<=I(b)&&5<=parseInt(d,10))):-1!=this.a.indexOf("Mozilla")&&(a="Mozilla"),b=E(this.a,/rv:([^\)]+)/,1),""==b?b="Unknown":d||(d=I(b),e=parseInt(E(b,/\d+\.(\d+)/,1),10),g=parseInt(E(b,/\d+\.\d+\.(\d+)/,1),10),d=1<d||1==d&&9<e||1==d&&9==e&&2<=g||b.match(/1\.9\.1b[123]/)!=l||b.match(/1\.9\.1\.[\d\.]+/)!=l),a=new B(a,c,"Gecko",b,F(this),G(this),H(this.k),d)):a=ca;return a};
function F(a){var c=E(a.a,/(iPod|iPad|iPhone|Android)/,1);if(""!=c)return c;a=E(a.a,/(Linux|Mac_PowerPC|Macintosh|Windows)/,1);return""!=a?("Mac_PowerPC"==a&&(a="Macintosh"),a):"Unknown"}function G(a){var c=E(a.a,/(OS X|Windows NT|Android) ([^;)]+)/,2);if(c||(c=E(a.a,/(iPhone )?OS ([\d_]+)/,2)))return c;return(a=E(a.a,/Linux ([i\d]+)/,1))?a:"Unknown"}function I(a){a=E(a,/(\d+)/,1);return""!=a?parseInt(a,10):-1}function E(a,c,b){return(a=a.match(c))&&a[b]?a[b]:""}
function H(a){if(a.documentMode)return a.documentMode};function ea(a,c,b){this.c=a;this.g=c;this.V=b;this.j="wf";this.h=new fa("-")}function ga(a){z(a.g,a.h.e(a.j,"loading"));J(a,"loading")}function K(a){A(a.g,a.h.e(a.j,"loading"));ba(a.g,a.h.e(a.j,"active"))||z(a.g,a.h.e(a.j,"inactive"));J(a,"inactive")}function J(a,c,b,d){if(a.V[c])a.V[c](b,d)};function ha(){this.ea={}}function ia(a,c){var b=[],d;for(d in c)if(c.hasOwnProperty(d)){var e=a.ea[d];e&&b.push(e(c[d]))}return b};function L(a,c,b,d,e){this.c=a;this.A=c;this.n=b;this.u=d;this.D=e;this.L=0;this.ia=this.da=o}L.prototype.watch=function(a,c,b,d,e){for(var g=a.length,f=0;f<g;f++){var k=a[f];c[k]||(c[k]=["n4"]);this.L+=c[k].length}e&&(this.da=e);for(f=0;f<g;f++)for(var k=a[f],e=c[k],m=b[k],j=0,n=e.length;j<n;j++){var D=e[j],r=this.A,O=k,da=D;z(r.g,r.h.e(r.j,O,da,"loading"));J(r,"fontloading",O,da);r=s(this,this.oa);O=s(this,this.pa);(new d(r,O,this.c,this.n,this.u,this.D,k,D,m)).start()}};
L.prototype.oa=function(a,c){var b=this.A;A(b.g,b.h.e(b.j,a,c,"loading"));A(b.g,b.h.e(b.j,a,c,"inactive"));z(b.g,b.h.e(b.j,a,c,"active"));J(b,"fontactive",a,c);this.ia=i;ja(this)};L.prototype.pa=function(a,c){var b=this.A;A(b.g,b.h.e(b.j,a,c,"loading"));ba(b.g,b.h.e(b.j,a,c,"active"))||z(b.g,b.h.e(b.j,a,c,"inactive"));J(b,"fontinactive",a,c);ja(this)};
function ja(a){0==--a.L&&a.da&&(a.ia?(a=a.A,A(a.g,a.h.e(a.j,"loading")),A(a.g,a.h.e(a.j,"inactive")),z(a.g,a.h.e(a.j,"active")),J(a,"active")):K(a.A))};function M(a,c,b,d,e,g,f,k,m){this.I=a;this.Z=c;this.c=b;this.n=d;this.u=e;this.D=g;this.ya=new ka;this.v=new N;this.M=f;this.B=k;this.qa=m||"BESbswy";this.P=la(this,"arial,'URW Gothic L',sans-serif");this.Q=la(this,"Georgia,'Century Schoolbook L',serif");this.ba=this.P;this.ca=this.Q;this.R=P(this,"arial,'URW Gothic L',sans-serif");this.S=P(this,"Georgia,'Century Schoolbook L',serif")}M.prototype.start=function(){this.ha=this.D();this.K()};
M.prototype.K=function(){var a=this.n.p(this.R),c=this.n.p(this.S);(this.P!=a||this.Q!=c)&&this.ba==a&&this.ca==c?Q(this,this.I):5E3<=this.D()-this.ha?Q(this,this.Z):(this.ba=a,this.ca=c,ma(this))};function ma(a){a.u(function(a,b){return function(){b.call(a)}}(a,a.K),25)}function Q(a,c){w(a.R);w(a.S);c(a.M,a.B)}function la(a,c){var b=P(a,c,i),d=a.n.p(b);w(b);return d}function P(a,c,b){c=a.c.createElement("span",{style:R(a,c,a.B,b)},a.qa);v(a.c,"body",c);return c}
function R(a,c,b,d){b=a.v.expand(b);return"position:absolute;top:-999px;left:-999px;font-size:300px;width:auto;height:auto;line-height:normal;margin:0;padding:0;font-variant:normal;font-family:"+(d?"":a.ya.quote(a.M)+",")+c+";"+b};function S(a,c,b,d,e){this.c=a;this.W=c;this.g=b;this.u=d;this.a=e;this.N=this.O=0}S.prototype.q=function(a,c){this.W.ea[a]=c};S.prototype.load=function(a){var c=new ea(this.c,this.g,a);this.a.w()?na(this,c,a):K(c)};S.prototype.wa=function(a,c,b,d){var e=a.Y?a.Y():M;d?a.load(s(this,this.Aa,c,b,e)):(a=0==--this.O,this.N--,a&&(0==this.N?K(c):ga(c)),b.watch([],{},{},e,a))};
S.prototype.Aa=function(a,c,b,d,e,g){var f=0==--this.O;f&&ga(a);this.u(s(this,function(a,b,c,d,e,g){a.watch(b,c||{},d||{},e,g)},c,d,e,g,b,f))};function na(a,c,b){b=ia(a.W,b);a.N=a.O=b.length;for(var d=new L(a.c,c,{p:function(a){return a.offsetWidth}},a.u,function(){return(new Date).getTime()}),e=0,g=b.length;e<g;e++){var f=b[e];f.z(a.a,s(a,a.wa,f,c,d))}};function fa(a){this.xa=a||"-"}fa.prototype.e=function(a){for(var c=[],b=0;b<arguments.length;b++)c.push(arguments[b].replace(/[\W_]+/g,"").toLowerCase());return c.join(this.xa)};function ka(){this.ga="'"}ka.prototype.quote=function(a){for(var c=[],a=a.split(/,\s*/),b=0;b<a.length;b++){var d=a[b].replace(/['"]/g,"");-1==d.indexOf(" ")?c.push(d):c.push(this.ga+d+this.ga)}return c.join(",")};function N(){this.H=oa;this.o=pa}var oa=["font-style","font-weight"],pa={"font-style":[["n","normal"],["i","italic"],["o","oblique"]],"font-weight":[["1","100"],["2","200"],["3","300"],["4","400"],["5","500"],["6","600"],["7","700"],["8","800"],["9","900"],["4","normal"],["7","bold"]]};function T(a,c,b){this.$=a;this.Da=c;this.o=b}T.prototype.compact=function(a,c){for(var b=0;b<this.o.length;b++)if(c==this.o[b][1]){a[this.$]=this.o[b][0];break}};
T.prototype.expand=function(a,c){for(var b=0;b<this.o.length;b++)if(c==this.o[b][0]){a[this.$]=this.Da+":"+this.o[b][1];break}};N.prototype.compact=function(a){for(var c=["n","4"],a=a.split(";"),b=0,d=a.length;b<d;b++){var e=a[b].replace(/\s+/g,"").split(":");if(2==e.length){var g=e[1];a:{for(var e=e[0],f=0;f<this.H.length;f++)if(e==this.H[f]){e=new T(f,e,this.o[e]);break a}e=l}e&&e.compact(c,g)}}return c.join("")};
N.prototype.expand=function(a){if(2!=a.length)return l;for(var c=[l,l],b=0,d=this.H.length;b<d;b++){var e=this.H[b];(new T(b,e,this.o[e])).expand(c,a.substr(b,1))}return c[0]&&c[1]?c.join(";")+";":l};window.WebFont=function(){var a=(new C(navigator.userAgent,document)).parse();return new S(new t(document),new ha,document.documentElement,function(a,b){setTimeout(a,b)},a)}();window.WebFont.load=window.WebFont.load;window.WebFont.addModule=window.WebFont.q;B.prototype.getName=B.prototype.getName;B.prototype.getVersion=B.prototype.va;B.prototype.getEngine=B.prototype.X;B.prototype.getEngineVersion=B.prototype.sa;B.prototype.getPlatform=B.prototype.ta;B.prototype.getPlatformVersion=B.prototype.ua;
B.prototype.getDocumentMode=B.prototype.ra;B.prototype.isSupportingWebFont=B.prototype.w;function U(a,c){this.c=a;this.d=c}U.prototype.load=function(a){for(var c=this.d.urls||[],b=this.d.families||[],d=0,e=c.length;d<e;d++)v(this.c,"head",x(this.c,c[d]));a(b)};U.prototype.z=function(a,c){return c(a.w())};window.WebFont.q("custom",function(a){return new U(new t(document),a)});function V(a,c,b,d,e,g,f,k,m){V.Ea.call(this,a,c,b,d,e,g,f,k,m);a="Times New Roman,Lucida Sans Unicode,Courier New,Tahoma,Arial,Microsoft Sans Serif,Times,Lucida Console,Sans,Serif,Monospace".split(",");c=a.length;b={};d=P(this,a[0],i);b[this.n.p(d)]=i;for(e=1;e<c;e++)g=a[e],u(this.c,d,R(this,g,this.B,i)),b[this.n.p(d)]=i,"4"!=this.B[1]&&(u(this.c,d,R(this,g,this.B[0]+"4",i)),b[this.n.p(d)]=i);w(d);this.t=b;this.ka=o}
(function(a,c){function b(){}b.prototype=a.prototype;c.prototype=new b;c.Ea=a;c.Ha=a.prototype})(M,V);var qa={Arimo:i,Cousine:i,Tinos:i};V.prototype.K=function(){var a=this.n.p(this.R),c=this.n.p(this.S);!this.ka&&a==c&&this.t[a]&&(this.t={},this.ka=this.t[a]=i);(this.P!=a||this.Q!=c)&&!this.t[a]&&!this.t[c]?Q(this,this.I):5E3<=this.D()-this.ha?this.t[a]&&this.t[c]&&qa[this.M]?Q(this,this.I):Q(this,this.Z):ma(this)};function ra(a){this.J=a?a:("https:"==window.location.protocol?"https:":"http:")+sa;this.f=[];this.T=[]}var sa="//fonts.googleapis.com/css";ra.prototype.e=function(){if(0==this.f.length)throw Error("No fonts to load !");if(-1!=this.J.indexOf("kit="))return this.J;for(var a=this.f.length,c=[],b=0;b<a;b++)c.push(this.f[b].replace(/ /g,"+"));a=this.J+"?family="+c.join("%7C");0<this.T.length&&(a+="&subset="+this.T.join(","));return a};function ta(a){this.f=a;this.fa=[];this.ja={};this.G={};this.v=new N}var ua={ultralight:"n2",light:"n3",regular:"n4",bold:"n7",italic:"i4",bolditalic:"i7",ul:"n2",l:"n3",r:"n4",b:"n7",i:"i4",bi:"i7"},va={latin:"BESbswy",cyrillic:"&#1081;&#1103;&#1046;",greek:"&#945;&#946;&#931;",khmer:"&#x1780;&#x1781;&#x1782;",Hanuman:"&#x1780;&#x1781;&#x1782;"};
ta.prototype.parse=function(){for(var a=this.f.length,c=0;c<a;c++){var b=this.f[c].split(":"),d=b[0].replace(/\+/g," "),e=["n4"];if(2<=b.length){var g;var f=b[1];g=[];if(f)for(var f=f.split(","),k=f.length,m=0;m<k;m++){var j;j=f[m];if(j.match(/^[\w ]+$/)){var n=ua[j];n?j=n:(n=j.match(/^(\d*)(\w*)$/),j=n[1],n=n[2],j=(j=this.v.expand([n?n:"n",j?j.substr(0,1):"4"].join("")))?this.v.compact(j):l)}else j="";j&&g.push(j)}0<g.length&&(e=g);3==b.length&&(b=b[2],g=[],b=!b?g:b.split(","),0<b.length&&(b=va[b[0]])&&
(this.G[d]=b))}this.G[d]||(b=va[d])&&(this.G[d]=b);this.fa.push(d);this.ja[d]=e}};function W(a,c,b){this.a=a;this.c=c;this.d=b}W.prototype.z=function(a,c){c(a.w())};W.prototype.Y=function(){return"AppleWebKit"==this.a.X()?V:M};W.prototype.load=function(a){"MSIE"==this.a.getName()&&this.d.blocking!=i?aa(s(this,this.aa,a)):this.aa(a)};W.prototype.aa=function(a){for(var c=this.c,b=new ra(this.d.api),d=this.d.families,e=d.length,g=0;g<e;g++){var f=d[g].split(":");3==f.length&&b.T.push(f.pop());b.f.push(f.join(":"))}d=new ta(d);d.parse();v(c,"head",x(c,b.e()));a(d.fa,d.ja,d.G)};
window.WebFont.q("google",function(a){var c=(new C(navigator.userAgent,document)).parse();return new W(c,new t(document),a)});function X(a,c){this.c=a;this.d=c}var wa={regular:"n4",bold:"n7",italic:"i4",bolditalic:"i7",r:"n4",b:"n7",i:"i4",bi:"i7"};X.prototype.z=function(a,c){return c(a.w())};
X.prototype.load=function(a){var c,b;v(this.c,"head",x(this.c,("https:"==document.location.protocol?"https:":"http:")+"//webfonts.fontslive.com/css/"+this.d.key+".css"));var d=this.d.families,e,g;e=[];g={};for(var f=0,k=d.length;f<k;f++){b=b=c=h;b=d[f].split(":");c=b[0];if(b[1]){b=b[1].split(",");for(var m=[],j=0,n=b.length;j<n;j++){var D=b[j];if(D){var r=wa[D];m.push(r?r:D)}}b=m}else b=["n4"];e.push(c);g[c]=b}a(e,g)};window.WebFont.q("ascender",function(a){return new X(new t(document),a)});function Y(a,c,b){this.m=a;this.c=c;this.d=b;this.f=[];this.s={};this.v=new N}Y.prototype.C=function(a){return("https:"==this.m.location.protocol?"https:":"http:")+(this.d.api||"//f.fontdeck.com/s/css/js/")+this.m.document.location.hostname+"/"+a+".js"};
Y.prototype.z=function(a,c){var b=this.d.id,d=this;b?(this.m.__webfontfontdeckmodule__||(this.m.__webfontfontdeckmodule__={}),this.m.__webfontfontdeckmodule__[b]=function(a,b){for(var f=0,k=b.fonts.length;f<k;++f){var m=b.fonts[f];d.f.push(m.name);d.s[m.name]=[d.v.compact("font-weight:"+m.weight+";font-style:"+m.style)]}c(a)},v(this.c,"head",y(this.c,this.C(b)))):c(i)};Y.prototype.load=function(a){a(this.f,this.s)};window.WebFont.q("fontdeck",function(a){return new Y(window,new t(document),a)});function Z(a,c,b,d,e){this.m=a;this.a=c;this.c=b;this.k=d;this.d=e;this.f=[];this.s={}}Z.prototype.z=function(a,c){var b=this,d=b.d.projectId;if(d){var e=y(b.c,b.C(d));e.id="__MonotypeAPIScript__"+d;e.onreadystatechange=function(a){if("loaded"===e.readyState||"complete"===e.readyState)e.onreadystatechange=l,e.onload(a)};e.onload=function(){if(b.m["__mti_fntLst"+d]){var e=b.m["__mti_fntLst"+d]();if(e&&e.length){var f;for(f=0;f<e.length;f++)b.f.push(e[f].fontfamily)}}c(a.w())};v(this.c,"head",e)}else c(i)};
Z.prototype.C=function(a){var c=this.protocol(),b=(this.d.api||"fast.fonts.com/jsapi").replace(/^.*http(s?):(\/\/)?/,"");return c+"//"+b+"/"+a+".js"};Z.prototype.load=function(a){a(this.f,this.s)};Z.prototype.protocol=function(){var a=["http:","https:"],c=a[0];if(this.k&&this.k.location&&this.k.location.protocol)for(var b=0,b=0;b<a.length;b++)if(this.k.location.protocol===a[b])return this.k.location.protocol;return c};
window.WebFont.q("monotype",function(a){var c=(new C(navigator.userAgent,document)).parse();return new Z(window,c,new t(document),document,a)});function $(a,c,b){this.m=a;this.c=c;this.d=b;this.f=[];this.s={}}$.prototype.C=function(a){var c="https:"==window.location.protocol?"https:":"http:";return(this.d.api||c+"//use.typekit.com")+"/"+a+".js"};$.prototype.z=function(a,c){var b=this.d.id,d=this.d,e=this;b?(this.m.__webfonttypekitmodule__||(this.m.__webfonttypekitmodule__={}),this.m.__webfonttypekitmodule__[b]=function(b){b(a,d,function(a,b,d){e.f=b;e.s=d;c(a)})},v(this.c,"head",y(this.c,this.C(b)))):c(i)};
$.prototype.load=function(a){a(this.f,this.s)};window.WebFont.q("typekit",function(a){return new $(window,new t(document),a)});window.WebFontConfig&&window.WebFont.load(window.WebFontConfig);
})(this,document);

