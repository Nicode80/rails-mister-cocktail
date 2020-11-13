import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('.typed-text', {
    strings: ["Mojito", "Aperol Spritz", "Margarita"],
    typeSpeed: 50,
    loop: true,
    attr: "placeholder"
  });
}

export { loadDynamicBannerText };
