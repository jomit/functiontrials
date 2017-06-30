#load "getdatafromexternalapi.csx"

using System;

public static void Run(string deviceMessage, TraceWriter log)
{
    log.Info($"Got Message => {deviceMessage}");

    var externalData = GetDataFromExternalAPI(log, deviceMessage);

    log.Info(externalData);
}
