const multiply = require('./multiply');

test('multiplies 2 * 3 to equal 6', () => {
  expect(multiply(2, 3)).toBe(6);
});

test('multiplies -2 * 3 to equal -6', () => {
  expect(multiply(-2, 3)).toBe(-6);
});

test('multiplies 0 * 10 to equal 0', () => {
  expect(multiply(0, 10)).toBe(0);
});
