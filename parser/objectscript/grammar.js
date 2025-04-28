// Tree-sitter grammar for ObjectScript
module.exports = grammar({
  name: 'objectscript',

  rules: {
    source_file: $ => repeat($._statement),

    _statement: $ => choice(
      $.class_definition,
      $.method_definition,
      $.assignment_statement,
      $.comment
    ),

    class_definition: $ => seq('Class', $.identifier, '{', repeat($._statement), '}'),

    method_definition: $ => seq('Method', $.identifier, '(', optional($.parameters), ')', '{', repeat($._statement), '}'),

    assignment_statement: $ => seq($.identifier, '=', $._expression),

    _expression: $ => choice(
      $.identifier,
      $.string,
      $.number,
      $.system_call
    ),

    parameters: $ => seq($.identifier, repeat(seq(',', $.identifier))),

    system_call: $ => seq('$', $.identifier, '.', $.identifier),

    comment: $ => token(seq('//', /.*/)),

    identifier: $ => /[A-Za-z_][A-Za-z0-9_]*/,
    string: $ => /"[^"]*"/,
    number: $ => /\d+/,
  }
});
