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

// src/create-a-clock-d-in-timer.tsx
var create_a_clock_d_in_timer_exports = {};
__export(create_a_clock_d_in_timer_exports, {
  default: () => Command
});
module.exports = __toCommonJS(create_a_clock_d_in_timer_exports);
var import_api = require("@raycast/api");
var import_node_timers = require("node:timers");
var import_node_child_process = require("node:child_process");
var import_jsx_runtime = require("react/jsx-runtime");
function Command() {
  async function handleSubmit(values) {
    const { timer } = values;
    const message = values.message.replace(/{values.timer}/g, timer);
    const title = values.title.replace(/{values.timer}/g, timer);
    (0, import_api.closeMainWindow)();
    (0, import_node_timers.setTimeout)(() => {
      (0, import_node_child_process.exec)(`/Users/joshkennedy/bin/notify ${message} ${title}`, function(error, stdout, stderr) {
        console.log(stdout);
      });
      (0, import_node_child_process.exec)(`say ${message}`, function(error, stdout, stderr) {
        console.log(stdout);
      });
    }, parseInt(timer) * 60 * 1e3);
  }
  return /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(
    import_api.Form,
    {
      actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.ActionPanel, { children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action.SubmitForm, { onSubmit: handleSubmit }) }),
      children: [
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.TextField, { id: "title", title: "Title", placeholder: "Alerts Title", defaultValue: "Hey There!\u{1F44B}" }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.TextArea, { id: "message", title: "Message", placeholder: "Enter multi-line text", defaultValue: `You asked me to alert you in {values.timer}` }),
        /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Separator, {}),
        /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(
          import_api.Form.Dropdown,
          {
            id: "timer",
            title: "Alert In",
            defaultValue: "5",
            children: [
              /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, { value: "5", title: "5 minutes" }),
              /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, { value: "10", title: "10 minutes" }),
              /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, { value: "20", title: "20 minutes" }),
              /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, { value: "30", title: "30 minutes" }),
              /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, { value: "60", title: "1 hour" })
            ]
          }
        )
      ]
    }
  );
}
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vcHJvamVjdHMvY2xvY2stZC1pbi9zcmMvY3JlYXRlLWEtY2xvY2stZC1pbi10aW1lci50c3giXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IEZvcm0sIEFjdGlvblBhbmVsLCBBY3Rpb24sIGNsb3NlTWFpbldpbmRvdyB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcbmltcG9ydCB7IHNldFRpbWVvdXQgfSBmcm9tIFwibm9kZTp0aW1lcnNcIjtcbmltcG9ydCB7IGV4ZWMgfSBmcm9tIFwibm9kZTpjaGlsZF9wcm9jZXNzXCI7XG5cbnR5cGUgVmFsdWVzID0ge1xuXHR0aW1lcjogc3RyaW5nO1xuXHR0aXRsZTogc3RyaW5nO1xuXHRtZXNzYWdlOiBzdHJpbmc7XG59O1xuXG5leHBvcnQgZGVmYXVsdCBmdW5jdGlvbiBDb21tYW5kKCkge1xuICBhc3luYyBmdW5jdGlvbiBoYW5kbGVTdWJtaXQodmFsdWVzOiBWYWx1ZXMpIHtcblx0XHRjb25zdCB7dGltZXJ9ID0gdmFsdWVzXG5cdFx0Y29uc3QgbWVzc2FnZSA9IHZhbHVlcy5tZXNzYWdlLnJlcGxhY2UoL3t2YWx1ZXMudGltZXJ9L2csIHRpbWVyKVxuXHRcdGNvbnN0IHRpdGxlID0gdmFsdWVzLnRpdGxlLnJlcGxhY2UoL3t2YWx1ZXMudGltZXJ9L2csIHRpbWVyKVxuXHRcdFxuICAgIGNsb3NlTWFpbldpbmRvdygpO1xuXHRcdHNldFRpbWVvdXQoKCk9PntcbiAgICAgIGV4ZWMoYC9Vc2Vycy9qb3Noa2VubmVkeS9iaW4vbm90aWZ5ICR7bWVzc2FnZX0gJHt0aXRsZX1gLCBmdW5jdGlvbiAoZXJyb3IsIHN0ZG91dCwgc3RkZXJyKSB7XG4gICAgICAgIGNvbnNvbGUubG9nKHN0ZG91dCk7XG4gICAgICB9KTtcblx0XHRcdGV4ZWMoYHNheSAke21lc3NhZ2V9YCwgZnVuY3Rpb24gKGVycm9yLCBzdGRvdXQsIHN0ZGVycikge1xuICAgICAgICBjb25zb2xlLmxvZyhzdGRvdXQpO1xuICAgICAgfSk7XG5cdFx0fSwgcGFyc2VJbnQodGltZXIpICogNjAgKiAxMDAwKTtcbiAgfVxuXG4gIHJldHVybiAoXG4gICAgPEZvcm1cbiAgICAgIGFjdGlvbnM9e1xuICAgICAgICA8QWN0aW9uUGFuZWw+XG4gICAgICAgICAgPEFjdGlvbi5TdWJtaXRGb3JtIG9uU3VibWl0PXtoYW5kbGVTdWJtaXR9IC8+XG4gICAgICAgIDwvQWN0aW9uUGFuZWw+XG4gICAgICB9XG4gICAgPlxuICAgICAgPEZvcm0uVGV4dEZpZWxkIGlkPVwidGl0bGVcIiB0aXRsZT1cIlRpdGxlXCIgcGxhY2Vob2xkZXI9XCJBbGVydHMgVGl0bGVcIiBkZWZhdWx0VmFsdWU9XCJIZXkgVGhlcmUhXHVEODNEXHVEQzRCXCIgLz5cbiAgICAgIDxGb3JtLlRleHRBcmVhIGlkPVwibWVzc2FnZVwiIHRpdGxlPVwiTWVzc2FnZVwiIHBsYWNlaG9sZGVyPVwiRW50ZXIgbXVsdGktbGluZSB0ZXh0XCIgZGVmYXVsdFZhbHVlPXtgWW91IGFza2VkIG1lIHRvIGFsZXJ0IHlvdSBpbiB7dmFsdWVzLnRpbWVyfWB9IC8+XG4gICAgICA8Rm9ybS5TZXBhcmF0b3IgLz5cbiAgICAgIDxGb3JtLkRyb3Bkb3duXG4gICAgICAgIGlkPVwidGltZXJcIlxuICAgICAgICB0aXRsZT1cIkFsZXJ0IEluXCJcblx0XHRcdFx0ZGVmYXVsdFZhbHVlPVwiNVwiXG4gICAgICA+XG4gICAgICAgIDxGb3JtLkRyb3Bkb3duLkl0ZW0gdmFsdWU9XCI1XCIgdGl0bGU9XCI1IG1pbnV0ZXNcIiAvPlxuICAgICAgICA8Rm9ybS5Ecm9wZG93bi5JdGVtIHZhbHVlPVwiMTBcIiB0aXRsZT1cIjEwIG1pbnV0ZXNcIiAvPlxuICAgICAgICA8Rm9ybS5Ecm9wZG93bi5JdGVtIHZhbHVlPVwiMjBcIiB0aXRsZT1cIjIwIG1pbnV0ZXNcIiAvPlxuICAgICAgICA8Rm9ybS5Ecm9wZG93bi5JdGVtIHZhbHVlPVwiMzBcIiB0aXRsZT1cIjMwIG1pbnV0ZXNcIiAvPlxuICAgICAgICA8Rm9ybS5Ecm9wZG93bi5JdGVtIHZhbHVlPVwiNjBcIiB0aXRsZT1cIjEgaG91clwiIC8+XG4gICAgICA8L0Zvcm0uRHJvcGRvd24+XG4gICAgPC9Gb3JtPlxuICApO1xufVxuIl0sCiAgIm1hcHBpbmdzIjogIjs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUEsaUJBQTJEO0FBQzNELHlCQUEyQjtBQUMzQixnQ0FBcUI7QUE2Qlg7QUFyQkssU0FBUixVQUEyQjtBQUNoQyxpQkFBZSxhQUFhLFFBQWdCO0FBQzVDLFVBQU0sRUFBQyxNQUFLLElBQUk7QUFDaEIsVUFBTSxVQUFVLE9BQU8sUUFBUSxRQUFRLG1CQUFtQixLQUFLO0FBQy9ELFVBQU0sUUFBUSxPQUFPLE1BQU0sUUFBUSxtQkFBbUIsS0FBSztBQUV6RCxvQ0FBZ0I7QUFDbEIsdUNBQVcsTUFBSTtBQUNYLDBDQUFLLGlDQUFpQyxPQUFPLElBQUksS0FBSyxJQUFJLFNBQVUsT0FBTyxRQUFRLFFBQVE7QUFDekYsZ0JBQVEsSUFBSSxNQUFNO0FBQUEsTUFDcEIsQ0FBQztBQUNKLDBDQUFLLE9BQU8sT0FBTyxJQUFJLFNBQVUsT0FBTyxRQUFRLFFBQVE7QUFDbkQsZ0JBQVEsSUFBSSxNQUFNO0FBQUEsTUFDcEIsQ0FBQztBQUFBLElBQ0wsR0FBRyxTQUFTLEtBQUssSUFBSSxLQUFLLEdBQUk7QUFBQSxFQUM5QjtBQUVBLFNBQ0U7QUFBQSxJQUFDO0FBQUE7QUFBQSxNQUNDLFNBQ0UsNENBQUMsMEJBQ0Msc0RBQUMsa0JBQU8sWUFBUCxFQUFrQixVQUFVLGNBQWMsR0FDN0M7QUFBQSxNQUdGO0FBQUEsb0RBQUMsZ0JBQUssV0FBTCxFQUFlLElBQUcsU0FBUSxPQUFNLFNBQVEsYUFBWSxnQkFBZSxjQUFhLHVCQUFlO0FBQUEsUUFDaEcsNENBQUMsZ0JBQUssVUFBTCxFQUFjLElBQUcsV0FBVSxPQUFNLFdBQVUsYUFBWSx5QkFBd0IsY0FBYywrQ0FBK0M7QUFBQSxRQUM3SSw0Q0FBQyxnQkFBSyxXQUFMLEVBQWU7QUFBQSxRQUNoQjtBQUFBLFVBQUMsZ0JBQUs7QUFBQSxVQUFMO0FBQUEsWUFDQyxJQUFHO0FBQUEsWUFDSCxPQUFNO0FBQUEsWUFDVixjQUFhO0FBQUEsWUFFVDtBQUFBLDBEQUFDLGdCQUFLLFNBQVMsTUFBZCxFQUFtQixPQUFNLEtBQUksT0FBTSxhQUFZO0FBQUEsY0FDaEQsNENBQUMsZ0JBQUssU0FBUyxNQUFkLEVBQW1CLE9BQU0sTUFBSyxPQUFNLGNBQWE7QUFBQSxjQUNsRCw0Q0FBQyxnQkFBSyxTQUFTLE1BQWQsRUFBbUIsT0FBTSxNQUFLLE9BQU0sY0FBYTtBQUFBLGNBQ2xELDRDQUFDLGdCQUFLLFNBQVMsTUFBZCxFQUFtQixPQUFNLE1BQUssT0FBTSxjQUFhO0FBQUEsY0FDbEQsNENBQUMsZ0JBQUssU0FBUyxNQUFkLEVBQW1CLE9BQU0sTUFBSyxPQUFNLFVBQVM7QUFBQTtBQUFBO0FBQUEsUUFDaEQ7QUFBQTtBQUFBO0FBQUEsRUFDRjtBQUVKOyIsCiAgIm5hbWVzIjogW10KfQo=
