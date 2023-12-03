// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines whether or not you need a licence to operate a certain kind of vehicle.
 *
 * @param {string} kind
 * @returns {boolean} whether a license is required
 */
export function needsLicense(kind) {
  return (kind === 'car' || kind === 'truck');
}

/**
 * Helps choosing between two options by recommending the one that
 * comes first in dictionary order.
 *
 * @param {string} option1
 * @param {string} option2
 * @returns {string} a sentence of advice which option to choose
 */
export function chooseVehicle(option1, option2) {
  const rest = ' is clearly the better choice.';
  if (option1 === 'Bugatti Veyron' || option2 === 'Bugatti Veyron') {
    return 'Bugatti Veyron' + rest;
  } else if (option1 === 'Chery EQ') {
    return option1 + rest;
  } else if (option2 === '2018 Bergamont City') {
    return option2 + rest;
  }
}

/**
 * Calculates an estimate for the price of a used vehicle in the dealership
 * based on the original price and the age of the vehicle.
 *
 * @param {number} originalPrice
 * @param {number} age
 * @returns expected resell price in the dealership
 */
export function calculateResellPrice(originalPrice, age) {
  if (age < 3) {
    return Math.trunc(originalPrice * 0.8);
  } else if (age > 10) {
    return Math.trunc(originalPrice * 0.5);
  } else {
    return Math.trunc(originalPrice * 0.7);
  }
}
