function madLib(s1, s2, s3) {
  console.log(`We shall ${s1.toUpperCase()} the ${s2.toUpperCase()} ${s3.toUpperCase()}`)
}

// madLib("make", "best", "guac")

function isSubstring(string, sub) {
  let l = sub.length
  for (let i = 0; i < string.length - l; i++) {
    if (string.substring(i,i+l) === sub) {
      return true;
    }
  }
  return false;
}

// console.log(isSubstring("time to program", "time"));

// console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(arr) {
  let fizz = []
  for (i = 0; i < arr.length; i++) {
    if (arr[i] % 5 === 0 || arr[i] % 3 === 0) {
      fizz.push(arr[i])
    }
  }
  return fizz
}

// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10]));


function isPrime(n) {
  if (n === 2) {
    return true;
  }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}
// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));


function sumOfNPrimes(n) {
  let counter = 0
  let num = 2
  let sum = 0
  while (counter < n) {
    if (isPrime(num)) {
      sum += num
      counter += 1
    }
    num += 1
  }

  return sum
}

// console.log(sumOfNPrimes(0));
// console.log(sumOfNPrimes(1));
// console.log(sumOfNPrimes(4));


function titleize(names, callback) {
  names = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  names.forEach(callback);
}

function printCallback(name) {
  console.log(name);
}

// titleize(["Mary", "Brian", "Leo"], printCallback);


function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick)
};

Elephant.prototype.play = function () {
  rand = Math.floor(Math.random(this.tricks.length + 1))
  console.log(`${this.name} is ${this.tricks[rand]}`);
};

// ellie = new Elephant("ellie", 24, ["playing in the water"])
// console.log(ellie);
//
// ellie.grow()
// console.log(ellie);
// ellie.trumpet()
// ellie.addTrick("jumping around")
// console.log(ellie);
// ellie.play()

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(el) {
  console.log(`${el.name} is trotting by!`);
}

// Elephant.paradeHelper(micah);
herd.forEach(Elephant.paradeHelper)

function dinerBreakfast(food) {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  }
}

let bfastOrder = dinerBreakfast();
console.log(bfastOrder("chocolate chip pancakes"));
console.log(bfastOrder("grits"));
