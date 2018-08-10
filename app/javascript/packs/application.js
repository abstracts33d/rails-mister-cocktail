/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
console.log('Hello World from Webpacker')


import Typed from 'typed.js';

var options = {
  strings: ["Try me out ;)", "Search by name", "Or by Ingredient", ""],
  typeSpeed: 25
}
const typed1 = new Typed(".search-input-1", options);
const typed2 = new Typed(".search-input-2", options);




import AOS from 'aos';
AOS.init();
