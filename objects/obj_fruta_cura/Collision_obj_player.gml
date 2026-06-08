var pegou = false;

// Tenta colocar a MAÇÃ na mochila (se tiver menos de 3)
if (tipo == 0 && other.macas_coletadas < 3) {
    other.macas_coletadas += 1;
    pegou = true;
} 
// Tenta colocar a BANANA na mochila (se tiver menos de 3)
else if (tipo == 1 && other.bananas_coletadas < 3) {
    other.bananas_coletadas += 1;
    pegou = true;
}

// Se o Leo conseguiu guardar a fruta na mochila, ela some do chão.
// NOTA: A cura NÃO acontece aqui. A cura só acontece no Step do Player ao apertar Q!
if (pegou == true) {
    instance_destroy();
}