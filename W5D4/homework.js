function madLib(verb, adjective, noun) {
  return 'We shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase() + ' .';
}

function isSubstring(searchString, subString) {
  return searchString.indexOf(subString) !== -1 ? true : false;
}

function fizzBuzz(numbers) {

  return numbers.filter(function(num) {
    return (num % 3 === 0 || num % 5 === 0) && num % 15 !== 0;
  });
}

function isPrime(number) {

  for (var i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
}


function sumOfNPrimes(n) {
  if (n === 0)
    return 0;

  primes = [2];

  while (primes.length < n) {
    next_prime = generate_next_prime(primes[primes.length - 1]);
    primes.push(next_prime);
  }

  return primes.reduce(function(sum, num) {
    return sum + num;
  });
}


function generateNextPrime(num) {
  next_prime = num + 1;

  while (true) {
    if (isPrime(next_prime))
      return next_prime;

    next_prime++;
  }
}

function log(array) {
  array.forEach(function(el) {
    console.log(el);
  });
}

function titleize(names, callback) {
  titles = names.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });

  callback(titles);
}

function Elephant(name, height_in_inches, tricks) {
  this.name = name;
  this.height_in_inches = height_in_inches;
  this.tricks = [tricks];
}

Elephant.prototype.trumpet = function() {
  console.log("the elephant goes 'phRRRRRRRRRRRRRRRR!!!");
}

Elephant.prototype.grow = function() {
  this.height_in_inches += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  random_index = Math.floor(Math.random()*this.tricks.length);
  random_trick = this.tricks[random_index];
  console.log(random_trick);
}
