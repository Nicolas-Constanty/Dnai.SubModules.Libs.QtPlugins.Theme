#include "dnaitheme_plugin.h"

#include <QDebug>
#include <qqml.h>

void DnaiThemePlugin::registerTypes(const char *uri)
{
    // @uri com.saltystudio.fontawesomecomponent
    Q_ASSERT(uri == QLatin1String("Dnai.Theme"));
    qDebug() << "==ThemePlugin== Dnai.Theme 1.0 successfully loaded";
}

