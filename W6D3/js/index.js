console.log("Hello from the JavaScript console!");

// Your AJAX request here
let timesUrl = 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b';
let ajaxOptions = {
  url: timesUrl,
  dataType: 'json',
  success: (resp) => console.log(resp),
  error: () => console.log('failure :(')
}

$.ajax(ajaxOptions);
// Add another console log here, outside your AJAX request
console.log("Hello from the JavaScript console!");
