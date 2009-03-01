/**
* jQuery dotNet Plugin - http://code.google.com/p/jquerydotnetplugin/
* Copyright (c) 2008 Walter Poch (http://wpoch.com.ar || http://wpoch.wordpress.com)
* Licensed under the GPL (http://www.gnu.org/copyleft/gpl.html) license.
*
* $Date: 2008-09-05
*/
// Plugin definition
(function($) {
    // Plugin implementation
    $.callDotNet = function(url, data, callback) {
        // Helper method
        var evalJSON = function(json) {
            return eval("(" + json + ")");
        };
        
        // shift arguments if data argument was ommited
        if (jQuery.isFunction(data)) {
            callback = data;
            data = "{}";
        }

        return jQuery.ajax({
            type: "POST",
            url: url,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(msg) {
                var result = evalJSON(msg.d);
                return callback(result);
            },
            error: $.callDotNet.onError
        });
    }

    // Default implementation of the error function
    $.callDotNet.onError = function(error) {
        alert("There was an error processing your request.\n"
                    + "[" + error.status + "]"
                    + " [" + error.statusText + "]");
    }    

    // private function for debugging
    function debug(log) {
        if (window.console && window.console.log)
            window.console.log(log);
    };    
})(jQuery);