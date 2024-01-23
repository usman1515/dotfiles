return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	opts = {
		ui = {
			-- automatically check for new versions when opening the :Mason window.
			check_outdated_packages_on_open = true,
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		pip = {
			-- upgrade pip to latest ver in venv before installing packages.
			upgrade_pip = true,
			-- these args will be added to `pip install` calls.
			install_args = {},
		},

	},
}
