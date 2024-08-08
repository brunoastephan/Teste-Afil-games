// Desenhar o botão
draw_self(); // Desenha o sprite do botão

// Adicionar efeitos visuais se necessário (ex: cor de destaque)
if (is_pressed) {
    draw_set_color(c_orange);
    draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);
}
