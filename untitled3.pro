QT += quick

QT += 3dcore 3drender 3dinput 3dquick qml quick 3dquickextras 3danimation

SOURCES += \
        main.cpp

OTHER_FILES += \
    main.qml \
    DefaultSceneEntity.qml \
    SkinnedEntity.qml \
    SkinnedPbrEffect.qml

RESOURCES += qml.qrc

DISTFILES += \
    skinnedPbr.vert
