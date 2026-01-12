local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- Go snippets
ls.add_snippets("go", {
  -- Swagger endpoint documentation
  s("swag", {
    t("// @Summary "), i(1, "Summary"),
    t({ "", "// @Description " }), i(2, "Description"),
    t({ "", "// @Tags " }), i(3, "tag"),
    t({ "", "// @Accept json" }),
    t({ "", "// @Produce json" }),
    t({ "", "// @Param " }), i(4, "name query string false \"description\""),
    t({ "", "// @Success 200 {object} " }), i(5, "Response"),
    t({ "", "// @Failure 400 {object} " }), i(6, "ErrorResponse"),
    t({ "", "// @Router " }), i(7, "/path"), t(" ["), i(8, "get"), t("]"),
    i(0),
  }),

  -- Swagger with body param
  s("swagbody", {
    t("// @Summary "), i(1, "Summary"),
    t({ "", "// @Description " }), i(2, "Description"),
    t({ "", "// @Tags " }), i(3, "tag"),
    t({ "", "// @Accept json" }),
    t({ "", "// @Produce json" }),
    t({ "", "// @Param request body " }), i(4, "RequestBody"), t(" true \"request body\""),
    t({ "", "// @Success 200 {object} " }), i(5, "Response"),
    t({ "", "// @Failure 400 {object} " }), i(6, "ErrorResponse"),
    t({ "", "// @Router " }), i(7, "/path"), t(" ["), i(8, "post"), t("]"),
    i(0),
  }),

  -- Swagger param variations
  s("swagparam", {
    t("// @Param "), i(1, "name"), t(" "),
    c(2, {
      t("query"),
      t("path"),
      t("header"),
      t("body"),
      t("formData"),
    }),
    t(" "), i(3, "string"), t(" "),
    c(4, {
      t("true"),
      t("false"),
    }),
    t(" \""), i(5, "description"), t("\""),
  }),

  -- Swagger success response
  s("swagsuccess", {
    t("// @Success "), i(1, "200"), t(" {"),
    c(2, {
      t("object"),
      t("array"),
      t("string"),
    }),
    t("} "), i(3, "Response"),
  }),

  -- Swagger failure response
  s("swagfail", {
    t("// @Failure "), i(1, "400"), t(" {object} "), i(2, "ErrorResponse"),
  }),

  -- Swagger security
  s("swagsec", {
    t("// @Security "), i(1, "BearerAuth"),
  }),

  -- Error handling
  s("iferr", {
    t("if err != nil {"),
    t({ "", "\treturn " }), i(1, "err"),
    t({ "", "}" }),
    i(0),
  }),

  -- Error wrap
  s("errw", {
    t("fmt.Errorf(\""), i(1, "context"), t(": %w\", "), i(2, "err"), t(")"),
  }),

  -- Function
  s("fn", {
    t("func "), i(1, "name"), t("("), i(2), t(") "), i(3, "error"), t(" {"),
    t({ "", "\t" }), i(0),
    t({ "", "}" }),
  }),

  -- Method
  s("meth", {
    t("func ("), i(1, "s *Service"), t(") "), i(2, "Name"), t("("), i(3, "ctx context.Context"), t(") "), i(4, "error"), t(" {"),
    t({ "", "\t" }), i(0),
    t({ "", "}" }),
  }),

  -- Struct
  s("st", {
    t("type "), i(1, "Name"), t(" struct {"),
    t({ "", "\t" }), i(0),
    t({ "", "}" }),
  }),

  -- Interface
  s("iface", {
    t("type "), i(1, "Name"), t(" interface {"),
    t({ "", "\t" }), i(0),
    t({ "", "}" }),
  }),

  -- Test function
  s("test", {
    t("func Test"), i(1, "Name"), t("(t *testing.T) {"),
    t({ "", "\t" }), i(0),
    t({ "", "}" }),
  }),

  -- Table-driven test
  s("ttest", {
    t("func Test"), i(1, "Name"), t("(t *testing.T) {"),
    t({ "", "\ttests := []struct {" }),
    t({ "", "\t\tname string" }),
    t({ "", "\t\t" }), i(2, "input string"),
    t({ "", "\t\t" }), i(3, "want string"),
    t({ "", "\t}{" }),
    t({ "", "\t\t{" }),
    t({ "", "\t\t\tname: \"" }), i(4, "test case"), t("\","),
    t({ "", "\t\t\t" }), i(5, "input: \"value\""), t(","),
    t({ "", "\t\t\t" }), i(6, "want: \"expected\""), t(","),
    t({ "", "\t\t}," }),
    t({ "", "\t}" }),
    t({ "", "" }),
    t({ "", "\tfor _, tt := range tests {" }),
    t({ "", "\t\tt.Run(tt.name, func(t *testing.T) {" }),
    t({ "", "\t\t\t" }), i(0),
    t({ "", "\t\t})" }),
    t({ "", "\t}" }),
    t({ "", "}" }),
  }),

  -- Context with timeout
  s("ctxtimeout", {
    t("ctx, cancel := context.WithTimeout("), i(1, "ctx"), t(", "), i(2, "5*time.Second"), t(")"),
    t({ "", "defer cancel()" }),
  }),

  -- Defer close
  s("deferclose", {
    t("defer func() {"),
    t({ "", "\tif err := " }), i(1, "resource"), t(".Close(); err != nil {"),
    t({ "", "\t\t" }), i(2, "log.Printf(\"failed to close: %v\", err)"),
    t({ "", "\t}" }),
    t({ "", "}()" }),
  }),

  -- JSON struct tag
  s("json", {
    t("`json:\""), i(1, "field"), t("\"`"),
  }),

  -- JSON + DB tags
  s("tags", {
    t("`json:\""), i(1, "field"), t("\" db:\""), i(2, "field"), t("\"`"),
  }),
})

-- Configure LuaSnip
ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

return ls
