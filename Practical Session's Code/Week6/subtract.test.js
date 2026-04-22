const subtract = require('./subtract');

describe('subtract function', () => {

  test('subtracts two positive numbers', () => {
    expect(subtract(10, 5)).toBe(5);
  });

  test('handles negative numbers', () => {
    expect(subtract(5, -3)).toBe(8);
  });

  test('handles zero', () => {
    expect(subtract(10, 0)).toBe(10);
  });

});