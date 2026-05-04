# COBOL Batch Processor

[English](#english) | [Português (Brasil)](#português-brasil) | [Español](#español)

---

## English

A batch remittance processor developed in COBOL, showcasing mission-critical architecture patterns and modern integration in Linux environments.

### Engineering Highlights
- **Dual-Standard Codebase**: Implementation in both language standards:
    - `Fixed Format`: ANSI-85 (Mainframe) with rigid column numbering and margins.
    - `Free Format`: Modern (Open Systems/Cloud) standard compatible with GnuCOBOL.
- **Build Automation**: Uses `Makefile` for compilation management.
- **Automated Testing**: Integrated Shell Script test suite for data integrity validation.
- **CI/CD**: Automated pipeline via GitHub Actions.

### How to Run
```bash
make build-fixed  # Compile Fixed Format
make build-free   # Compile Free Format
make run-free      # Execute
make test          # Run automated tests
```

---

## Português (Brasil)

Processador de arquivos de remessa bancária desenvolvido em COBOL, demonstrando padrões de arquitetura de missão crítica e integração moderna em sistemas Linux.

### Diferenciais de Engenharia
- **Dual-Standard Codebase**: Implementação em ambos os padrões da linguagem:
    - `Fixed Format`: Padrão ANSI-85 (Mainframe) com numeração de colunas e margens rígidas.
    - `Free Format`: Padrão moderno (Open Systems/Cloud) compatível com GnuCOBOL.
- **Automação de Build**: Utilização de `Makefile`.
- **Testes Automatizados**: Suíte de testes em Shell Script.
- **CI/CD**: Pipeline automatizado via GitHub Actions.

### Como Executar
```bash
make build-fixed  # Compila versão Fixed Format
make build-free   # Compila versão Free Format
make run-free      # Executa
make test          # Roda os testes
```

---

## Español

Procesador de remesas bancarias desarrollado en COBOL, que muestra patrones de arquitectura de misión crítica e integración moderna en entornos Linux.

### Aspectos Destacados de Ingeniería
- **Dual-Standard Codebase**: Implementación en ambos estándares del lenguaje:
    - `Fixed Format`: Estándar ANSI-85 (Mainframe) con numeración rígida de columnas y márgenes.
    - `Free Format`: Estándar moderno (Sistemas Abiertos/Nube) compatible con GnuCOBOL.
- **Automatización de Compilación**: Uso de `Makefile`.
- **Pruebas Automatizadas**: Suite de pruebas en Shell Script para validación de integridad.
- **CI/CD**: Pipeline automatizado mediante GitHub Actions.

### Cómo Ejecutar
```bash
make build-fixed  # Compilar Formato Fijo
make build-free   # Compilar Formato Libre
make run-free      # Ejecutar
make test          # Ejecutar pruebas
```
