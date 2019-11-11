**Instituto Federal de Santa Catarina**

# Processamento de Sinais Digitais 

Repositório para uso na disciplina de Processamento de Sinais Digitais (PSD29007) do curso de Engenharia de Telecomunicações do Instituto Federal de Santa Catarina - câmpus São José, realizada em 2019.2

# Aulas

## SETEMBRO

### 16/set/2019

Filtros Digitais. Protótipo, transformação de frequência e transformação bilinear.

- [transformacao_filtro_digital_PB.m](https://github.com/yanmartins/PSD29007/blob/master/transformacao_filtro_digital_PB.m)   Projeto de um filtro passa baixa digital
- [transformacao_filtro_digital_PF.m](https://github.com/yanmartins/PSD29007/blob/master/transformacao_filtro_digital_PF.m)   Projeto de um filtro passa faixa digital

### 26/set/2019

Filtro de janela retangular.

- [filtro_janela_retangular.m](https://github.com/yanmartins/PSD29007/blob/master/filtro_janela_retangular.m)

### 30/set/2019

Tipos de janelas temporais usadas em projetos de filtros digitais. Retangular, Hamming, Hann e Blackman.

- [janelas_temporais.m](https://github.com/yanmartins/PSD29007/blob/master/janelas_temporais.m)


## OUTUBRO

## 03/out/2019

Projeto de um filtro passa alta utilizando janelas temporais.

- [FPA_janela.m](https://github.com/yanmartins/PSD29007/blob/master/FPA_janela.m)	Tentar automatizar o processo.

## 07/out/2019

Projeto de um filtro passa faixa utilizando janela temporal de Kaiser.

- [FPF_janela_kaiser.m](https://github.com/yanmartins/PSD29007/blob/master/FPF_janela_kaiser.m)
- [FPF_janela_kaiser_vProf.m](https://github.com/yanmartins/PSD29007/blob/master/FPF_janela_kaiser_vProf.m)	Versão do Professor

## 10/out/2019

- [fir_ajustes](https://github.com/yanmartins/PSD29007/blob/master/fir_ajustes.m)
- [Filtros_Parks_McClellan.m](https://github.com/yanmartins/PSD29007/blob/master/Filtros_Parks_McClellan.m)

## 21/out/2019

Filtros com o Simulink e FDA Tools. Diferenças de visualização entre Time Scope e Analisador de espectro. Utilizando concatenação de matrizes ao invés de um mux.

- [filtrosFIR.fda](https://github.com/yanmartins/PSD29007/blob/master/Simulink_filtrosFIR/filtrosFIR.fda)		Filtros gerados no FDATool
- [filtrosFIR.slx](https://github.com/yanmartins/PSD29007/blob/master/Simulink_filtrosFIR/filtrosFIR.slx)	Projeto Simulink

## NOVEMBRO

## 04/nov/2019

Realizando análises do espectro.

- [valores_simulink.m](https://github.com/yanmartins/PSD29007/blob/master/valores_simulink)	Valores para serem carregados no Simulink
- [filtrosFIR.fda](https://github.com/yanmartins/PSD29007/blob/master/Simulink_filtrosFIR/filtrosFIR.fda)		Filtros gerados no FDATool
- [analisando_espectro.slx](https://github.com/yanmartins/PSD29007/blob/master/Simulink_filtrosFIR/analisando_espectro.slx)	Projeto Simulink

## 07/nov/2019

Durante a simulação utiliza-se frame based, pois é mais rápido. Porém, ao transferí-lo para o HDL deve-se utilizar sample based (para a versão 2015 do Matlab).

Para configurar o Simulink para sistemas discretos execute o comando dspstartup.m antes de abrir um novo modelo.

## 11/nov/2019

Realização de filtros IIR.

- [realizacoes_iir.fda](https://github.com/yanmartins/PSD29007/blob/master/FDATool/realizacoes_iir.fda)
