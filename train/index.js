const totalIntegers = (object) => {
  let sum = 0;
  const values = Object.values(object);
  for (const value of values) {
    if (typeof value === "number"){
      sum += 1;
    }
  };
  const nestedObjest = values.filter((value) => typeof value === "object" && value !== null);
  if (nestedObjest){
    totalIntegers(nestedObjest)
  };
}
