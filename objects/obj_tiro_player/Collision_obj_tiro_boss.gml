// Sorteia um número de 1 a 100. Se cair de 1 a 30 (30% de chance)...
if (irandom_range(1, 100) <= 30) {
    // Destrói a bala do Boss!
    with (other) {
        instance_destroy();
    }
}

// O seu tiro sempre se quebra ao bater no do Boss, mesmo se não destruir o dele
instance_destroy();