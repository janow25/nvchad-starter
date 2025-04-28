package tree_sitter_objectscript_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_objectscript "github.com/tree-sitter/tree-sitter-objectscript/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_objectscript.Language())
	if language == nil {
		t.Errorf("Error loading Objectscript grammar")
	}
}
