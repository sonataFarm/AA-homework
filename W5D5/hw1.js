window.setTimeout(() => alert('HAMMERTIME'), 5000);

function hammerTime(time) {
  window.setTimeout(() => alert(`${time} is hammertime!`), time);
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question('Would you like some tea?\n', (teaResponse) => {
  console.log(teaResponse);
  reader.question('Would you like biscuits?\n', (biscuitResponse) => {
    console.log(`So you ${teaResponse} want tea and you ${biscuitResponse} want biscuits.`);
    reader.close();
  });
});

var a = 3;
