﻿(function ($) {
    $.dnnSF = function (moduleId) {
        // To avoid scope issues, use 'base' instead of 'this'
        // to reference this class from internal events and functions.
        var base = this;

        base.getServiceRoot = function (moduleName) {
            var serviceRoot = dnn.getVar("sf_siteRoot", "/");
            serviceRoot += "DesktopModules/" + moduleName + "/API/";
            return serviceRoot;
        };

        base.getTabId = function () {
            return dnn.getVar("sf_tabId", -1);
        };

        base.getModuleId = function () {
            return moduleId;
        };

        base.setModuleHeaders = function (xhr) {
            xhr.setRequestHeader("ModuleId", base.getModuleId());
            xhr.setRequestHeader("TabId", base.getTabId());
        };

        base.getAntiForgeryKey = function () {
            return "__RequestVerificationToken";
        };

        base.getAntiForgeryValue = function () {
            return $('[name="__RequestVerificationToken"]').val();
        };

        base.getAntiForgeryProperty = function (hash) {
            if (!hash) {
                hash = {};
            }

            hash[base.getAntiForgeryKey()] = base.getAntiForgeryValue();
            return hash;
        };

        return base;
    };

    $.ServicesFramework = function (moduleId) {
        return new $.dnnSF(moduleId);
    };

})(jQuery);
//----------------------------
