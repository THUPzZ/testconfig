declare const CONFIG: { string: string };

let selectedEnvironment;

if (typeof CONFIG === 'undefined') {
  selectedEnvironment = {
    apiUrl: 'http://localhost:3000',
  };
} else {
  selectedEnvironment = CONFIG;
}

export const environment = selectedEnvironment;
