// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "jquery";
// import "popper.js";

import('stylesheets/application.scss');

import('packs/select_value_dropdown.js')
import('packs/select_value_cookie.js')
import('packs/retailer_token.js')
import('packs/update_retailer_token.js')
import('packs/zoom_photo.js')
import('packs/checkout.js')
