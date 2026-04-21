# Keylogger - Keyboard Capture Demo (Educational) ⌨️

## 📌 Sobre o Projeto

Aplicação Delphi educacional para demonstração de captura de eventos de teclado. Desenvolvido exclusivamente para fins de aprendizado sobre hooks do Windows e API de baixo nível.

## ⚠️ AVISO IMPORTANTE

**Este projeto é EXCLUSIVAMENTE para fins educacionais e de pesquisa.**

- ❌ NÃO deve ser usado para fins maliciosos
- ❌ NÃO deve ser usado sem consentimento explícito
- ❌ NÃO deve ser distribuído para uso não autorizado
- ✅ Respeite a privacidade e legislação vigente
- ✅ Use apenas em ambiente de testes controlado
- ✅ Nunca implemente em produção sem autorização legal

## 🎯 Objetivo Educacional

Demonstrar conceitos de programação Windows:
- Windows Hooks (SetWindowsHookEx)
- Captura de eventos de teclado
- API de baixo nível do Windows
- Callbacks e mensagens do sistema
- Segurança e privacidade

## 🚀 Tecnologias Utilizadas

- **Delphi** - IDE e linguagem Object Pascal
- **Windows API** - Hooks e eventos de sistema
- **VCL** - Visual Component Library

## 📁 Estrutura do Projeto

```
keylogger/
├── CaptureKeyboard.dpr     # Projeto de captura
├── KeyBoard.dpr            # Projeto principal
├── KeyBoard.res            # Recursos
├── Principal.pas           # Unit principal
├── Principal.dfm           # Form principal
└── README.md
```

## 🔐 Conceitos Demonstrados

### 1. Windows Hook

```pascal
function SetWindowsHookEx(
  idHook: Integer;
  lpfn: TFNHookProc;
  hmod: HINST;
  dwThreadId: DWORD
): HHOOK;
```

### 2. Keyboard Hook Callback

```pascal
function KeyboardProc(
  nCode: Integer;
  wParam: WPARAM;
  lParam: LPARAM
): LRESULT; stdcall;
begin
  if nCode >= 0 then
  begin
    // Processar tecla pressionada
    if wParam = WM_KEYDOWN then
    begin
      // Capturar tecla
    end;
  end;
  Result := CallNextHookEx(hHook, nCode, wParam, lParam);
end;
```

### 3. Instalação do Hook

```pascal
hHook := SetWindowsHookEx(
  WH_KEYBOARD_LL,
  @KeyboardProc,
  HInstance,
  0
);
```

## 💻 Como Compilar (Somente para Estudo)

### Pré-requisitos

- **Delphi 7+** ou **RAD Studio**
- **Windows**
- **Ambiente de testes isolado** (máquina virtual recomendada)
- **Conhecimento de APIs Windows**

### Opção 1: Compilar com Delphi IDE

1. Abrir `KeyBoard.dpr` no Delphi
2. Project > Build KeyBoard (ou pressionar **Shift+F9**)
3. **⚠️ NÃO executar fora de ambiente de testes**
4. **⚠️ NÃO distribuir ou usar para fins maliciosos**

### Opção 2: Linha de Comando

```bash
# Com Delphi Command Line Compiler
dcc32 -B KeyBoard.dpr

# ⚠️ IMPORTANTE: Use apenas em VM ou ambiente isolado
```

### Configuração de Ambiente Seguro

```
┌─────────────────────────────────┐
│  Host Machine (Seu Computador)  │
│                                 │
│  ┌───────────────────────────┐  │
│  │  Virtual Machine          │  │
│  │  (VMware / VirtualBox)    │  │
│  │                           │  │
│  │  ► Teste o código aqui   │  │
│  │  ► Sem rede externa      │  │
│  │  ► Snapshot para rollback│  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

## 📚 Aspectos Legais

### Brasil

- **Lei Carolina Dieckmann (Lei 12.737/2012)**: Criminaliza invasão de dispositivos
- **LGPD (Lei 13.709/2018)**: Proteção de dados pessoais
- **Código Penal**: Artigos sobre violação de privacidade

### Uso Legítimo

Keyloggers podem ser usados legalmente apenas:
- ✅ Monitoramento parental (com consentimento)
- ✅ Ambientes corporativos (com política explícita)
- ✅ Pesquisa de segurança (ambiente controlado)
- ✅ Fins educacionais (sem captura de dados reais)

## 🛡️ Detecção e Prevenção

Como identificar e prevenir keyloggers:

1. **Antivírus atualizado**
2. **Firewall ativo**
3. **Verificar processos suspeitos** (Task Manager)
4. **Autenticação de dois fatores**
5. **Teclado virtual** para senhas críticas
6. **Anti-keylogger** especializado

## 🎓 Alternativas Éticas

Para aprender sobre eventos de teclado, considere:

- **Input Method Editors (IME)**: APIs legítimas
- **Accessibility APIs**: Para ferramentas assistivas
- **Game Input**: DirectInput, XInput
- **Framework de testes**: Selenium, AutoIt

## 🔗 Referências Educacionais

- [MSDN - Windows Hooks](https://docs.microsoft.com/en-us/windows/win32/winmsg/hooks)
- [LGPD - Lei Geral de Proteção de Dados](http://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/L13709.htm)
- [OWASP - Security Best Practices](https://owasp.org/)
- [Delphi Low-Level Keyboard Hook](https://docwiki.embarcadero.com/Libraries/en/Winapi.Windows)

## ⚙️ Melhorias Implementadas

### ✅ Configuração
- **EditorConfig** adicionado para encoding UTF-8
- Configuração Delphi/Pascal
- Line endings Windows (CRLF)

### ✅ Documentação
- ⚠️ Avisos éticos reforçados
- Aspectos legais detalhados (LGPD, Lei Carolina Dieckmann)
- Ambiente seguro de testes documentado
- Alternativas éticas sugeridas
- Detecção e prevenção explicadas
- Exemplos de código educacionais

### ⚠️ Responsabilidade

Este projeto serve EXCLUSIVAMENTE para:
- 📚 Entender como hooks do Windows funcionam
- 🔒 Conscientização sobre segurança
- 🎓 Fins acadêmicos e educacionais
- 🛡️ Pesquisa de segurança ofensiva (ethical hacking)

**NUNCA para:**
- ❌ Roubo de informações
- ❌ Invasão de privacidade
- ❌ Uso sem consentimento
- ❌ Violação de leis

## 👨‍💻 Autor

Claudio Almeida

## 📝 Licença

Projeto educacional. Uso sob própria responsabilidade.

---

> **⚠️ DISCLAIMER FINAL**: O autor não se responsabiliza por uso indevido deste código. Este projeto é disponibilizado SOMENTE para fins educacionais. O uso malicioso é ilegal e punível por lei.

**Projeto educacional - USO RESPONSÁVEL OBRIGATÓRIO**

---

> **DISCLAIMER**: Este código é fornecido para fins educacionais. O autor não se responsabiliza por uso indevido. Sempre respeite a privacidade e as leis locais.

