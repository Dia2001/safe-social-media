/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    screens: {
      'sm': '350px',
      // => @media (min-width: 640px) { ... }

      'md': '768px',
      // => @media (min-width: 768px) { ... }

      'lg': '1024px',
      // => @media (min-width: 1024px) { ... }

      'xl': '1280px',
      // => @media (min-width: 1280px) { ... }
    },
    extend: {
      keyframes: {
        slowShow: {
          '0%': { opacity: 0},
          '100%': { opacity: 1},
        }
      },
      animation:{
        slowShow: 'slowShow 0.5s ease-in-out'
      },
      
      //customize own padding
      padding:{
        '1x':'8px',
        '2x':'16px',
        '3x':'24px',
        '4x':'32px',
        '5x':'48px',
      },
      //customize own margin
      margin:{
        '1x':'8px',
        '2x':'16px',
        '3x':'24px',
        '4x':'32px',
        '5x':'48px',
      },
      backgroundImage: {
        'GradientO1':'linear-gradient(120deg,#89F7FE 0%,#66A6FF 100%)',
        'GradientO2':'linear-gradient(to left,#0061FF 0%,#60EFFF 100%)',
      },
      colors:{
        'Primary':'#003060',
        'Secondary':'#055C9D',
        'Secondary2':'#0E86D4',
        'Secondary3':'#68BBE3',
        'Secondary4':'#B9E9FC',
        'Secondary5':'#DAF5FF',

        'BlackCool':'#2C3333',
        'Black75':'#616666',
        'Black50':'#959898',
        'Black25':'#cacbcb',
        'Black10':'#e9eaea',
        'Black5':'#f4f4f4',

        'ErrorColor':'#FD4040',
        'WarningColor':'#F9CE69',
        'ActiveColor':'#A7D129'
      }
    },
  },
  plugins: [],
}

