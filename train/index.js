const snakeCase = function(str) {
  const words = [];
  let current = '';

  for (let i = 0; i < str.length; i++){
    const char = str[i];
    const prev = str[i - 1];
    const next = str[i + 1];

    if(!isAlphaNumeric(char)){
      if (current) {
        words.push(current.toLowerCase());
        current = '';
      }
      continue;
    }

    if(prev && isLower(prev) && isUpper(char) && next && isLower(next)){
      words.push(current.toLowerCase());
      current = char;
      continue;
    }
    current += char;
  }

    if (current) {
      words.push(current.toLowerCase());
    }
    return words.join('_');
};

function isUpper(c){
  return c >= 'A' && c <= 'Z';
}

function isLower(c) {
  return c >= 'a' && c <= 'z';
}

function isAlphaNumeric(c){
  return isUpper(c) || isLower(c) || (c >= '0' && c <= '9');
}

module.exports = snakeCase;
