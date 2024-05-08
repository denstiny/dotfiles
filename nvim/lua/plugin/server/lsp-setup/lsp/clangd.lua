local M = {}
M = {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
		"--completion-style=detailed",
		"--cross-file-rename=true",
		--"--header-insertion=iwyu", -- completion auto import header file
		"--header-insertion=never", -- disable completion auto import header file
		"--pch-storage=memory",
		"--function-arg-placeholders=true",
		"--log=verbose",
		"--ranking-model=decision_forest",
		"--header-insertion-decorators",
		"-j=12",
		"--pretty",
	},
	extensions = {
		autoSetHints = true,
		-- These apply to the default ClangdSetInlayHints command
		inlay_hints = {
			only_current_line = true,
		},
	},
}

return M