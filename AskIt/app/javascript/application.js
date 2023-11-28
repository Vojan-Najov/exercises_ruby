// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import { start } from "@popperjs/core"

Rails.start()
Turbolinks.start()