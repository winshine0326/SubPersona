import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:subpersona/components/top_layout.dart';
import 'package:subpersona/components/task_btn.dart';
import 'package:subpersona/components/button.dart';
import 'package:subpersona/pages/3rd_section.dart';

class SecondSection extends StatefulWidget {
  @override
  _SecondSectionState createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  bool _dialogOpen = false;

  void _showSpeechDialog() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String recognizedText = '';
        late stt.SpeechToText _speech;
        bool isListening = false;

        return StatefulBuilder(
          builder: (context, setModalState) {
            Future<void> _startSpeech() async {
              _speech = stt.SpeechToText();

              final micStatus = await Permission.microphone.request();
              if (!micStatus.isGranted) {
                setModalState(() {
                  recognizedText = '⚠️ 마이크 권한이 필요합니다.';
                });
                return;
              }

              bool available = await _speech.initialize(
                onStatus: (status) {
                  if (status == 'done') {
                    setModalState(() {
                      isListening = false;
                    });
                  }
                },
                onError: (error) {
                  setModalState(() {
                    recognizedText = '오류: ${error.errorMsg}';
                    isListening = false;
                  });
                },
              );

              if (!available) {
                setModalState(() {
                  recognizedText = '음성 인식을 사용할 수 없습니다.';
                });
                return;
              }

              setModalState(() {
                isListening = true;
                recognizedText = '';
              });

              _speech.listen(
                localeId: 'ko_KR',
                onResult: (result) {
                  setModalState(() {
                    recognizedText = result.recognizedWords;
                  });
                },
              );
            }

            if (!_dialogOpen) {
              _dialogOpen = true;
              _startSpeech();
            }

            return CupertinoAlertDialog(
              title: Text('말해주세요'),
              content: Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    recognizedText.isNotEmpty ? recognizedText : '듣는 중...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('닫기'),
                  onPressed: () async {
                    _dialogOpen = false;
                    if (isListening) await _speech.stop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF18171D),
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopLayout(
                title: "‘안녕하세요' 를 읽어보세요",
                subtitle: "2단계",
                imgPath: "assets/Rock2.png",
                padding: 52,
                titleFont: 28,
              ),
              const SizedBox(height: 100),
              TaskBtn(
                ImgPath: "assets/mic.png",
                onPressed: _showSpeechDialog,
              ),
              const SizedBox(height: 88),
              Center(
                child: AnalyzeButton(
                  nextPage: ThirdSection(),
                  label: '다음으로',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
