/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.html"],
  theme: {
    extend: {
      colors: {
        orange: 'hsl(16,100%,50%)',
        orangeLight: 'hsl(39,100%,50%)',
        red: 'hsl(0, 100%, 50%)',
        greyLight: 'hsl(0, 0%, 93%)',
        greyMedium: 'hsl(0, 0%, 20%)',
        greyDark: 'hsl(0, 0%, 6%)',
        skyBlue: 'hsl(197, 71%, 73%)',
        darkBlue: 'hsl(240, 95%, 16%)',
      },
      fontFamily: {
        sans: ['Prompt', 'san-serif'],
        cursive: ['Caveat', 'cursive'],
        brush: ['Caveat Brush', 'cursive'],
      },
      spacing: {
        180: '32rem',
      },
    },
  },
  plugins: [],
}

