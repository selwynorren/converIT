public class Sequeler.Layouts.Welcome : Granite.Widgets.Welcome {
	public unowned Sequeler.Window window { get; construct; }

	public Welcome (Sequeler.Window main_window) {
		Object (
			window: main_window,
			title: _("Welcome to Sequeler"),
			subtitle: _("Connect to Any Local or Remote Database.")
		);
	}

	construct {
		valign = Gtk.Align.FILL;
		halign = Gtk.Align.FILL;
		vexpand = true;

		append ("bookmark-new", _("Add a New Database"), _("Connect to a Database and Save It in Your Library"));
		append ("window-new", _("New Window"), _("Open a New Sequeler Window"));
		append ("folder-download", _("Import Connections"), _("Import Previously Exported Sequeler Connections"));

		activated.connect ( index => {
			switch (index) {
				case 0:
					Sequeler.Services.ActionManager.action_from_group (Sequeler.Services.ActionManager.ACTION_NEW_CONNECTION, window.get_action_group ("win"));
				break;
				case 1:
					Sequeler.Services.ActionManager.action_from_group (Sequeler.Services.ActionManager.ACTION_NEW_WINDOW, window.get_action_group ("win"));
				break;
				case 2:
					import_file ();
				break;
			}
		});
	}

	private void import_file () {
		var open_dialog = new Gtk.FileChooserDialog ("Select a file",
													 window,
													 Gtk.FileChooserAction.OPEN,
													 _("_Cancel"),
													 Gtk.ResponseType.CANCEL,
													 _("_Open"),
													 Gtk.ResponseType.ACCEPT);

		open_dialog.local_only = true;
		open_dialog.set_modal (true);
		open_dialog.response.connect (open_file);
		open_dialog.show ();
	}

	private void open_file (Gtk.Dialog dialog, int response_id) {
		var open_dialog = dialog as Gtk.FileChooserDialog;

		switch (response_id) {
			case Gtk.ResponseType.ACCEPT:
				var file = open_dialog.get_file ();
				uint8[] file_contents;

				try {
					file.load_contents (null, out file_contents, null);
				}
				catch (GLib.Error err) {
					import_warning (err.message);
				}
				var imported_connections = (string) file_contents;
				var data = imported_connections.split ("---\n");
				foreach (var import in data) {
					if (import == "") {
						continue;
					}
					var array = settings.arraify_data (import);
					array["id"] = settings.tot_connections.to_string ();
					settings.add_connection (array);
				}

			break;

			case Gtk.ResponseType.CANCEL:
			break;
		}
		window.main.library.reload_library ();

		dialog.destroy ();
	}

	private void import_warning (string message) {
		var message_dialog = new Granite.MessageDialog.with_image_from_icon_name (_("Unable to Import Library "), message, "dialog-error", Gtk.ButtonsType.NONE);
		message_dialog.transient_for = window;

		var suggested_button = new Gtk.Button.with_label ("Close");
		message_dialog.add_action_widget (suggested_button, Gtk.ResponseType.ACCEPT);

		message_dialog.show_all ();
		if (message_dialog.run () == Gtk.ResponseType.ACCEPT) {}

		message_dialog.destroy ();
	}
}