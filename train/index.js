const people = [
      {
        name: "Carly",
        yearOfBirth: 1066,
      },
/*      {
        name: "Ray",
        yearOfBirth: 1962,
        yearOfDeath: 2011,
      },
      {
        name: "Jane",
        yearOfBirth: 1912,
        yearOfDeath: 1941,
      },
*/
];

const findLast = (people) => {
  return people.map((p) => {
    if(p.yearOfBirth === undefined) {
      p.yearOfBirth = new Date.prototype.getFullYear()
    };
  }
    return p.yearOfBirth
}
console.log(findLast(people))
