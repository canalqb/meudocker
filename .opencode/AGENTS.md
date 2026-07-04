# Master Rules @CanalQb — OpenCode Docker Agent

## Fonte primária
Sempre leia a versão mais recente antes de qualquer execução:
https://docs.google.com/document/d/1sTsRoAEWrU-1ltOMmUWyQ-18DFTmYl0R5UZc-QnNtCs/export?format=txt

## Regras UTF-8 e Qualidade de Conteúdo
- Toda saída (HTML, JSON, texto, JS, CSS) deve ser **UTF-8 puro**
- Nunca usar entidades HTML para acentos (`&atilde;`, `&eacute;`, etc.) — escreva o caractere UTF-8 diretamente: `ã`, `é`, `ç`
- Verificar encoding antes de publicar: títulos com acentos quebrados = republicar
- **Escreva de forma inteligente, não mecânica.** Seja direto, técnico e acessível. Use experiência real (E-E-A-T), não texto genérico. Priorize clareza e valor prático sobre regras burocráticas.
- **Cada post precisa ter pelo menos 1 insight original** — algo que só quem testou na prática saberia.

## Uso obrigatório dos MCPs
Ao criar qualquer página web ou post, o agente DEVE:
1. Usar **todos os MCPs disponíveis** que forem relevantes para enriquecer o conteúdo
2. Consultar `context7` para documentação técnica atualizada de bibliotecas/ferramentas mencionadas
3. Usar `ddgs` para pesquisa web quando o tema exigir dados atuais (versões, preços, notícias, APIs)
4. Usar `imagician` para processar imagens (resize, crop, convert, optimize) se necessário
5. Usar `ffmpeg-mcp` para obter info de mídia ou processar vídeo/áudio se aplicável
6. Usar `ollama-vision` para analisar screenshots ou imagens de referência
7. Usar `sqlite` e `jupyter` para análise de dados se o post envolver métricas ou experimentos
8. Usar `memory-official` e `simple-memory` para persistir estado entre execuções
9. Coletar o máximo de informação possível antes de escrever — nunca publiques com dados incompletos

## Gatilhos de Ação

| Comando | Ação |
|---------|------|
| `{Crie um post}` | Executa protocolo interno silenciosamente → entrega apenas: Metadados + HTML + Thumbnails JSON |
| `{Crie conteúdo}` | Gera apenas texto (sem HTML) |
| `{Preview do post}` | Estrutura leve + resumo para aprovação |
| `{Crie um Widget}` | HTML/JS/CSS com prefixo `widg_` |
| `{Crie thumbnail}` | JSON de prompt para Gemini Imagen (16:9, 9:16, 1:1) |
| `{Melhore o layout}` | Apenas CSS/HTML — nunca altera lógica ou texto |
| `{Audite o post}` | Analisa conteúdo contra AdSense + E-E-A-T + Silo |
| `{Audite}` | Auditoria completa de qualidade, compliance e performance |
| `{Corrija a rejeição}` | Diagnostica rejeição AdSense e corrige |
| `{Corrija}` | Ajuste cirúrgico baseado em erro ou feedback |

## Regras essenciais do post
- **Idioma:** Português PT-BR estritamente
- **Ordem de entrega:** Metadados → HTML → Thumbnails (nunca verbalizar etapas internas)
- **Pattern Interrupt obrigatório** na abertura — frase de impacto ≤ 15 palavras, sem exclamação
- **TL;DR (SGE Block)** obrigatório após o H1 — 3 bullets com insight, resultado e conclusão
- **FAQ accordion + FAQPage JSON-LD** obrigatório — mínimo 5 perguntas, respostas com ≥ 2 frases
- **Mínimo 1.500 palavras** no corpo visível (excluindo HTML/CSS/JS/JSON-LD) — é gate bloqueante
- **Schema BlogPosting + FAQPage** JSON-LD separados, `datePublished` preservado do original
- **Disclaimers obrigatórios** para cripto/scripts/automação/finanças
- **30 hashtags Instagram** (10 nicho + 10 médias + 10 amplas)

## Estrutura obrigatória do HTML (13 blocos nesta ordem)
1. Cabeçalho @CanalQb (fixo, primeiro elemento)
2. `<style>` com classes `post_cqb_` + CSS Signature
3. Título `<h1>` centralizado (30–60 caracteres)
4. Badge "Tempo de Leitura"
5. Bloco TL;DR (3 bullets)
6. Vídeo YouTube (template fixo)
7. Disclaimer (se aplicável)
8. Introdução com Pattern Interrupt
9. Corpo técnico (H2 em pergunta + answer target + Bucket Brigades)
10. Bloco FAQ (accordion + FAQPage JSON-LD)
11. Footer de Referências (`📚 Fontes e Referências`)
12. Schema BlogPosting JSON-LD
13. Rodapé / CTA (link YouTube)

## Compliance
- E-E-A-T obrigatório: experiência real demonstrada, Expertise (fontes oficiais), Authority (links internos/externos), Trust (HTTPS + disclaimers)
- AdSense: conteúdo original, sem clickbait, sem keyword stuffing
- LGPD, GDPR, EU AI Act, COPPA, IAPP — aplicar o mais restritivo
- Backup **sempre antes de publicar** — nunca sobrescrever sem backup
- Verificar encoding UTF-8 antes de publicar (especialmente títulos)
- Restaurar `/s2560-rw/` na URL da imagem original quando ausente

## Código seguro (regras inegociáveis)
- Zero `alert()` → usar `showToast()`
- Zero `eval()`, `document.write()`, `innerHTML` com input de usuário
- JS sempre em IIFE: `(function(){ 'use strict'; })();`
- `requestIdleCallback` para scripts não críticos
- Zero Unicode decorativo no HTML — `☑ ✓ ★ → •` sempre substituídos por `<i class="fas fa-..."></i>`
- Pseudo-elemento CSS com `content:"☑"` proibido — usar Font Awesome inline
- Links externos: `target="_blank" rel="noopener noreferrer"` sempre
- Imagens: `width` e `height` explícitos, `alt` preenchido, 1ª com `fetchpriority="high"`
