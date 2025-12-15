function pigLatin(word) {
  const vowels = ['a','e','i','o','u'];
  const lower = word.toLowerCase();

  if (vowels.includes(lower[0])) {
    return word + "way";
  }
  let index = 0;

  while (index < lower.length) {
    if (lower[index] === 'q' && lower[index + 1] === 'u'){
      index += 2;
      continue;
    }

    if(vowels.includes(lower[index])) {
      break;
    }

    index++;
  }
  return (word.slice(index) + word.slice(0,index) + 'ay');
};

