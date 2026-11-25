function toggleTheme() {
    // This toggles the 'dark-mode' class on the body element
    document.body.classList.toggle('dark-mode');
}

document.getElementById('loginForm').addEventListener('submit', function(event) {
    // 1. Impede o recarregamento da página (crucial para testes de UI)
    event.preventDefault();

    // 2. Captura os valores
    const user = document.getElementById('username').value;
    const msgElement = document.getElementById('message');

    // 3. Lógica de teste simples
    if (user === 'admin') {
        msgElement.textContent = "Login Efetuado com Sucesso.";
        msgElement.style.color = "green";
    } else {
        msgElement.textContent = "Login falhou. Use 'admin' no usuário.";
        msgElement.style.color = "red";
    }
});