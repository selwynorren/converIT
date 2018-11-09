public class converIT : Gtk.Application {

    public converIT () {
        Object (
            application_id: "com.github.selwynorren.converIT",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var label = new Gtk.Label ("Click me!");


        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.title = "converIT";

        main_window.add (label);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new converIT ();
        return app.run (args);
    }
}
