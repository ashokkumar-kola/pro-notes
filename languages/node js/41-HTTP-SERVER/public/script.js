const searchInput = document.getElementById('search');
const output = document.getElementById('output');

searchInput?.addEventListener('input', () => {
  output.textContent = `You searched for: ${searchInput.value}`;
});
