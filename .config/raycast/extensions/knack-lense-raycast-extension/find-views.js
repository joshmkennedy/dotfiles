"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/find-views.tsx
var find_views_exports = {};
__export(find_views_exports, {
  default: () => Command
});
module.exports = __toCommonJS(find_views_exports);
var import_api = require("@raycast/api");
var import_jsx_runtime = require("react/jsx-runtime");
function Command() {
  function handleSubmit(values) {
    console.log(values);
    (0, import_api.showToast)({ title: "Submitted form", message: "See logs for submitted values" });
  }
  return /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(
    import_api.Form,
    {
      actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.ActionPanel, { children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action.SubmitForm, { onSubmit: handleSubmit }) }),
      children: [
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Description, { text: "This form showcases all available form elements." }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.TextField, { id: "textfield", title: "Text field", placeholder: "Enter text", defaultValue: "Raycast" }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.TextArea, { id: "textarea", title: "Text area", placeholder: "Enter multi-line text" }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Separator, {}),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.DatePicker, { id: "datepicker", title: "Date picker" }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Checkbox, { id: "checkbox", title: "Checkbox", label: "Checkbox Label", storeValue: true }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown, { id: "dropdown", title: "Dropdown", children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, { value: "dropdown-item", title: "Dropdown Item" }) }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.TagPicker, { id: "tokeneditor", title: "Tag picker", children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.TagPicker.Item, { value: "tagpicker-item", title: "Tag Picker Item" }) })
      ]
    }
  );
}
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vcHJvamVjdHMva25hY2stbGVuc2UtcmF5Y2FzdC1leHRlbnNpb24vc3JjL2ZpbmQtdmlld3MudHN4Il0sCiAgInNvdXJjZXNDb250ZW50IjogWyJpbXBvcnQgeyBGb3JtLCBBY3Rpb25QYW5lbCwgQWN0aW9uLCBzaG93VG9hc3QgfSBmcm9tIFwiQHJheWNhc3QvYXBpXCI7XG5cbnR5cGUgVmFsdWVzID0ge1xuICB0ZXh0ZmllbGQ6IHN0cmluZztcbiAgdGV4dGFyZWE6IHN0cmluZztcbiAgZGF0ZXBpY2tlcjogRGF0ZTtcbiAgY2hlY2tib3g6IGJvb2xlYW47XG4gIGRyb3Bkb3duOiBzdHJpbmc7XG4gIHRva2VuZWRpdG9yOiBzdHJpbmdbXTtcbn07XG5cbmV4cG9ydCBkZWZhdWx0IGZ1bmN0aW9uIENvbW1hbmQoKSB7XG4gIGZ1bmN0aW9uIGhhbmRsZVN1Ym1pdCh2YWx1ZXM6IFZhbHVlcykge1xuICAgIGNvbnNvbGUubG9nKHZhbHVlcyk7XG4gICAgc2hvd1RvYXN0KHsgdGl0bGU6IFwiU3VibWl0dGVkIGZvcm1cIiwgbWVzc2FnZTogXCJTZWUgbG9ncyBmb3Igc3VibWl0dGVkIHZhbHVlc1wiIH0pO1xuICB9XG5cbiAgcmV0dXJuIChcbiAgICA8Rm9ybVxuICAgICAgYWN0aW9ucz17XG4gICAgICAgIDxBY3Rpb25QYW5lbD5cbiAgICAgICAgICA8QWN0aW9uLlN1Ym1pdEZvcm0gb25TdWJtaXQ9e2hhbmRsZVN1Ym1pdH0gLz5cbiAgICAgICAgPC9BY3Rpb25QYW5lbD5cbiAgICAgIH1cbiAgICA+XG4gICAgICA8Rm9ybS5EZXNjcmlwdGlvbiB0ZXh0PVwiVGhpcyBmb3JtIHNob3djYXNlcyBhbGwgYXZhaWxhYmxlIGZvcm0gZWxlbWVudHMuXCIgLz5cbiAgICAgIDxGb3JtLlRleHRGaWVsZCBpZD1cInRleHRmaWVsZFwiIHRpdGxlPVwiVGV4dCBmaWVsZFwiIHBsYWNlaG9sZGVyPVwiRW50ZXIgdGV4dFwiIGRlZmF1bHRWYWx1ZT1cIlJheWNhc3RcIiAvPlxuICAgICAgPEZvcm0uVGV4dEFyZWEgaWQ9XCJ0ZXh0YXJlYVwiIHRpdGxlPVwiVGV4dCBhcmVhXCIgcGxhY2Vob2xkZXI9XCJFbnRlciBtdWx0aS1saW5lIHRleHRcIiAvPlxuICAgICAgPEZvcm0uU2VwYXJhdG9yIC8+XG4gICAgICA8Rm9ybS5EYXRlUGlja2VyIGlkPVwiZGF0ZXBpY2tlclwiIHRpdGxlPVwiRGF0ZSBwaWNrZXJcIiAvPlxuICAgICAgPEZvcm0uQ2hlY2tib3ggaWQ9XCJjaGVja2JveFwiIHRpdGxlPVwiQ2hlY2tib3hcIiBsYWJlbD1cIkNoZWNrYm94IExhYmVsXCIgc3RvcmVWYWx1ZSAvPlxuICAgICAgPEZvcm0uRHJvcGRvd24gaWQ9XCJkcm9wZG93blwiIHRpdGxlPVwiRHJvcGRvd25cIj5cbiAgICAgICAgPEZvcm0uRHJvcGRvd24uSXRlbSB2YWx1ZT1cImRyb3Bkb3duLWl0ZW1cIiB0aXRsZT1cIkRyb3Bkb3duIEl0ZW1cIiAvPlxuICAgICAgPC9Gb3JtLkRyb3Bkb3duPlxuICAgICAgPEZvcm0uVGFnUGlja2VyIGlkPVwidG9rZW5lZGl0b3JcIiB0aXRsZT1cIlRhZyBwaWNrZXJcIj5cbiAgICAgICAgPEZvcm0uVGFnUGlja2VyLkl0ZW0gdmFsdWU9XCJ0YWdwaWNrZXItaXRlbVwiIHRpdGxlPVwiVGFnIFBpY2tlciBJdGVtXCIgLz5cbiAgICAgIDwvRm9ybS5UYWdQaWNrZXI+XG4gICAgPC9Gb3JtPlxuICApO1xufVxuIl0sCiAgIm1hcHBpbmdzIjogIjs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUEsaUJBQXFEO0FBa0JqRDtBQVBXLFNBQVIsVUFBMkI7QUFDaEMsV0FBUyxhQUFhLFFBQWdCO0FBQ3BDLFlBQVEsSUFBSSxNQUFNO0FBQ2xCLDhCQUFVLEVBQUUsT0FBTyxrQkFBa0IsU0FBUyxnQ0FBZ0MsQ0FBQztBQUFBLEVBQ2pGO0FBRUEsU0FDRTtBQUFBLElBQUM7QUFBQTtBQUFBLE1BQ0MsU0FDRSw0Q0FBQywwQkFDQyxzREFBQyxrQkFBTyxZQUFQLEVBQWtCLFVBQVUsY0FBYyxHQUM3QztBQUFBLE1BR0Y7QUFBQSxvREFBQyxnQkFBSyxhQUFMLEVBQWlCLE1BQUssb0RBQW1EO0FBQUEsUUFDMUUsNENBQUMsZ0JBQUssV0FBTCxFQUFlLElBQUcsYUFBWSxPQUFNLGNBQWEsYUFBWSxjQUFhLGNBQWEsV0FBVTtBQUFBLFFBQ2xHLDRDQUFDLGdCQUFLLFVBQUwsRUFBYyxJQUFHLFlBQVcsT0FBTSxhQUFZLGFBQVkseUJBQXdCO0FBQUEsUUFDbkYsNENBQUMsZ0JBQUssV0FBTCxFQUFlO0FBQUEsUUFDaEIsNENBQUMsZ0JBQUssWUFBTCxFQUFnQixJQUFHLGNBQWEsT0FBTSxlQUFjO0FBQUEsUUFDckQsNENBQUMsZ0JBQUssVUFBTCxFQUFjLElBQUcsWUFBVyxPQUFNLFlBQVcsT0FBTSxrQkFBaUIsWUFBVSxNQUFDO0FBQUEsUUFDaEYsNENBQUMsZ0JBQUssVUFBTCxFQUFjLElBQUcsWUFBVyxPQUFNLFlBQ2pDLHNEQUFDLGdCQUFLLFNBQVMsTUFBZCxFQUFtQixPQUFNLGlCQUFnQixPQUFNLGlCQUFnQixHQUNsRTtBQUFBLFFBQ0EsNENBQUMsZ0JBQUssV0FBTCxFQUFlLElBQUcsZUFBYyxPQUFNLGNBQ3JDLHNEQUFDLGdCQUFLLFVBQVUsTUFBZixFQUFvQixPQUFNLGtCQUFpQixPQUFNLG1CQUFrQixHQUN0RTtBQUFBO0FBQUE7QUFBQSxFQUNGO0FBRUo7IiwKICAibmFtZXMiOiBbXQp9Cg==
