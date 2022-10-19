// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require('datatables.net-bs5')
import 'bootstrap';


$('#table_desing').dataTable({
  pagingType: "simple_numbers",
  language: {
    paginate: {
      next: '<i class="fa fa-angle-right">',
      previous: '<i class="fa fa-angle-left">'
    }
  },
  order: [[ 0, "desc" ]]
});