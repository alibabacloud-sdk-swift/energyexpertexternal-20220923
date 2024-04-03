import Foundation
import Tea
import TeaUtils
import AlibabacloudOpenApi
import AlibabaCloudOpenApiUtil
import AlibabacloudEndpointUtil

open class Client : AlibabacloudOpenApi.Client {
    public override init(_ config: AlibabacloudOpenApi.Config) throws {
        try super.init(config)
        self._endpointRule = ""
        try checkConfig(config as! AlibabacloudOpenApi.Config)
        self._endpoint = try getEndpoint("energyexpertexternal", self._regionId ?? "", self._endpointRule ?? "", self._network ?? "", self._suffix ?? "", self._endpointMap ?? [:], self._endpoint ?? "")
    }

    public func getEndpoint(_ productId: String, _ regionId: String, _ endpointRule: String, _ network: String, _ suffix: String, _ endpointMap: [String: String], _ endpoint: String) throws -> String {
        if (!TeaUtils.Client.empty(endpoint)) {
            return endpoint as! String
        }
        if (!TeaUtils.Client.isUnset(endpointMap) && !TeaUtils.Client.empty(endpointMap[regionId as! String])) {
            return endpointMap[regionId as! String] ?? ""
        }
        return try AlibabacloudEndpointUtil.Client.getEndpointRules(productId, regionId, endpointRule, network, suffix)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func generateResultWithOptions(_ request: GenerateResultRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GenerateResultResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GenerateResult",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/generate",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GenerateResultResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func generateResult(_ request: GenerateResultRequest) async throws -> GenerateResultResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await generateResultWithOptions(request as! GenerateResultRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getAreaElecConstituteWithOptions(_ request: GetAreaElecConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetAreaElecConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetAreaElecConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/elec/area",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetAreaElecConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getAreaElecConstitute(_ request: GetAreaElecConstituteRequest) async throws -> GetAreaElecConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getAreaElecConstituteWithOptions(request as! GetAreaElecConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getCarbonEmissionTrendWithOptions(_ request: GetCarbonEmissionTrendRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetCarbonEmissionTrendResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleCode)) {
            body["moduleCode"] = request.moduleCode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleType)) {
            body["moduleType"] = request.moduleType!;
        }
        if (!TeaUtils.Client.isUnset(request.trendType)) {
            body["trendType"] = request.trendType!;
        }
        if (!TeaUtils.Client.isUnset(request.yearList)) {
            body["yearList"] = request.yearList ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetCarbonEmissionTrend",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/trend",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetCarbonEmissionTrendResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getCarbonEmissionTrend(_ request: GetCarbonEmissionTrendRequest) async throws -> GetCarbonEmissionTrendResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getCarbonEmissionTrendWithOptions(request as! GetCarbonEmissionTrendRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataItemListWithOptions(_ request: GetDataItemListRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDataItemListResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDataItemList",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/data/item/list",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDataItemListResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataItemList(_ request: GetDataItemListRequest) async throws -> GetDataItemListResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDataItemListWithOptions(request as! GetDataItemListRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataQualityAnalysisWithOptions(_ request: GetDataQualityAnalysisRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDataQualityAnalysisResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataQualityEvaluationType)) {
            body["dataQualityEvaluationType"] = request.dataQualityEvaluationType!;
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDataQualityAnalysis",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/data/quality/analysis",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDataQualityAnalysisResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDataQualityAnalysis(_ request: GetDataQualityAnalysisRequest) async throws -> GetDataQualityAnalysisResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDataQualityAnalysisWithOptions(request as! GetDataQualityAnalysisRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDeviceInfoWithOptions(_ request: GetDeviceInfoRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDeviceInfoResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.deviceId)) {
            query["deviceId"] = request.deviceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ds)) {
            query["ds"] = request.ds ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.factoryId)) {
            query["factoryId"] = request.factoryId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDeviceInfo",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/external/getDeviceInfo",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDeviceInfoResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDeviceInfo(_ request: GetDeviceInfoRequest) async throws -> GetDeviceInfoResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDeviceInfoWithOptions(request as! GetDeviceInfoRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDeviceListWithOptions(_ request: GetDeviceListRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetDeviceListResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.factoryId)) {
            query["factoryId"] = request.factoryId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetDeviceList",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/external/getDeviceList",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetDeviceListResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getDeviceList(_ request: GetDeviceListRequest) async throws -> GetDeviceListResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getDeviceListWithOptions(request as! GetDeviceListRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getElecConstituteWithOptions(_ request: GetElecConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetElecConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetElecConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/elec/constitute",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetElecConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getElecConstitute(_ request: GetElecConstituteRequest) async throws -> GetElecConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getElecConstituteWithOptions(request as! GetElecConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getElecTrendWithOptions(_ request: GetElecTrendRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetElecTrendResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.yearList)) {
            body["yearList"] = request.yearList ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetElecTrend",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/elec/trend",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetElecTrendResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getElecTrend(_ request: GetElecTrendRequest) async throws -> GetElecTrendResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getElecTrendWithOptions(request as! GetElecTrendRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEmissionSourceConstituteWithOptions(_ request: GetEmissionSourceConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetEmissionSourceConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleCode)) {
            body["moduleCode"] = request.moduleCode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleType)) {
            body["moduleType"] = request.moduleType!;
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetEmissionSourceConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/constitute",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetEmissionSourceConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEmissionSourceConstitute(_ request: GetEmissionSourceConstituteRequest) async throws -> GetEmissionSourceConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getEmissionSourceConstituteWithOptions(request as! GetEmissionSourceConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEmissionSummaryWithOptions(_ request: GetEmissionSummaryRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetEmissionSummaryResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleCode)) {
            body["moduleCode"] = request.moduleCode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleType)) {
            body["moduleType"] = request.moduleType!;
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetEmissionSummary",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/summary",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetEmissionSummaryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEmissionSummary(_ request: GetEmissionSummaryRequest) async throws -> GetEmissionSummaryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getEmissionSummaryWithOptions(request as! GetEmissionSummaryRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEpdInventoryConstituteWithOptions(_ request: GetEpdInventoryConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetEpdInventoryConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetEpdInventoryConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/epd/inventory/constitute",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetEpdInventoryConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEpdInventoryConstitute(_ request: GetEpdInventoryConstituteRequest) async throws -> GetEpdInventoryConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getEpdInventoryConstituteWithOptions(request as! GetEpdInventoryConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEpdSummaryWithOptions(_ request: GetEpdSummaryRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetEpdSummaryResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetEpdSummary",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/epd/summary",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetEpdSummaryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getEpdSummary(_ request: GetEpdSummaryRequest) async throws -> GetEpdSummaryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getEpdSummaryWithOptions(request as! GetEpdSummaryRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getFootprintListWithOptions(_ request: GetFootprintListRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetFootprintListResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.currentPage)) {
            body["currentPage"] = request.currentPage!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            body["pageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetFootprintList",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/product/list",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetFootprintListResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getFootprintList(_ request: GetFootprintListRequest) async throws -> GetFootprintListResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getFootprintListWithOptions(request as! GetFootprintListRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGasConstituteWithOptions(_ request: GetGasConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetGasConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleCode)) {
            body["moduleCode"] = request.moduleCode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleType)) {
            body["moduleType"] = request.moduleType!;
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetGasConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/gas/constitute",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetGasConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGasConstitute(_ request: GetGasConstituteRequest) async throws -> GetGasConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getGasConstituteWithOptions(request as! GetGasConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpBenchmarkListWithOptions(_ request: GetGwpBenchmarkListRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetGwpBenchmarkListResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetGwpBenchmarkList",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/gwp/benchmark/list",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetGwpBenchmarkListResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpBenchmarkList(_ request: GetGwpBenchmarkListRequest) async throws -> GetGwpBenchmarkListResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getGwpBenchmarkListWithOptions(request as! GetGwpBenchmarkListRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpBenchmarkSummaryWithOptions(_ request: GetGwpBenchmarkSummaryRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetGwpBenchmarkSummaryResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetGwpBenchmarkSummary",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/gwp/benchmark/summary",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetGwpBenchmarkSummaryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpBenchmarkSummary(_ request: GetGwpBenchmarkSummaryRequest) async throws -> GetGwpBenchmarkSummaryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getGwpBenchmarkSummaryWithOptions(request as! GetGwpBenchmarkSummaryRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpInventoryConstituteWithOptions(_ request: GetGwpInventoryConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetGwpInventoryConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetGwpInventoryConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/gwp/inventory/constitute",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetGwpInventoryConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpInventoryConstitute(_ request: GetGwpInventoryConstituteRequest) async throws -> GetGwpInventoryConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getGwpInventoryConstituteWithOptions(request as! GetGwpInventoryConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpInventorySummaryWithOptions(_ request: GetGwpInventorySummaryRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetGwpInventorySummaryResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetGwpInventorySummary",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/gwp/inventory/summary",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetGwpInventorySummaryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getGwpInventorySummary(_ request: GetGwpInventorySummaryRequest) async throws -> GetGwpInventorySummaryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getGwpInventorySummaryWithOptions(request as! GetGwpInventorySummaryRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getInventoryListWithOptions(_ request: GetInventoryListRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetInventoryListResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.emissionType)) {
            body["emissionType"] = request.emissionType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.group)) {
            body["group"] = request.group ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.methodType)) {
            body["methodType"] = request.methodType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetInventoryList",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/inventory/list",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetInventoryListResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getInventoryList(_ request: GetInventoryListRequest) async throws -> GetInventoryListResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getInventoryListWithOptions(request as! GetInventoryListRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getOrgAndFactoryWithOptions(_ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetOrgAndFactoryResponse {
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String]
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetOrgAndFactory",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/external/getOrgAndFactory",
            "method": "GET",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetOrgAndFactoryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getOrgAndFactory() async throws -> GetOrgAndFactoryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getOrgAndFactoryWithOptions(headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getOrgConstituteWithOptions(_ request: GetOrgConstituteRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetOrgConstituteResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleCode)) {
            body["moduleCode"] = request.moduleCode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.moduleType)) {
            body["moduleType"] = request.moduleType!;
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetOrgConstitute",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/analysis/org",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetOrgConstituteResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getOrgConstitute(_ request: GetOrgConstituteRequest) async throws -> GetOrgConstituteResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getOrgConstituteWithOptions(request as! GetOrgConstituteRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getPcrInfoWithOptions(_ request: GetPcrInfoRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetPcrInfoResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetPcrInfo",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/pcr/detail",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetPcrInfoResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getPcrInfo(_ request: GetPcrInfoRequest) async throws -> GetPcrInfoResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getPcrInfoWithOptions(request as! GetPcrInfoRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getReductionProposalWithOptions(_ request: GetReductionProposalRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> GetReductionProposalResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dataQualityEvaluationType)) {
            body["dataQualityEvaluationType"] = request.dataQualityEvaluationType!;
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GetReductionProposal",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/reduction/proposal",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GetReductionProposalResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func getReductionProposal(_ request: GetReductionProposalRequest) async throws -> GetReductionProposalResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await getReductionProposalWithOptions(request as! GetReductionProposalRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func isCompletedWithOptions(_ request: IsCompletedRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> IsCompletedResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.productId)) {
            body["productId"] = request.productId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            body["productType"] = request.productType!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "IsCompleted",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/footprint/result/completed",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(IsCompletedResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func isCompleted(_ request: IsCompletedRequest) async throws -> IsCompletedResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await isCompletedWithOptions(request as! IsCompletedRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func pushDeviceDataWithOptions(_ request: PushDeviceDataRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PushDeviceDataResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.deviceType)) {
            body["deviceType"] = request.deviceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.devices)) {
            body["devices"] = request.devices ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PushDeviceData",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/data/increment/push",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PushDeviceDataResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func pushDeviceData(_ request: PushDeviceDataRequest) async throws -> PushDeviceDataResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await pushDeviceDataWithOptions(request as! PushDeviceDataRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func pushItemDataWithOptions(_ request: PushItemDataRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> PushItemDataResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.items)) {
            body["items"] = request.items!;
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PushItemData",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/data/item/push",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PushItemDataResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func pushItemData(_ request: PushItemDataRequest) async throws -> PushItemDataResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await pushItemDataWithOptions(request as! PushItemDataRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func recalculateCarbonEmissionWithOptions(_ request: RecalculateCarbonEmissionRequest, _ headers: [String: String], _ runtime: TeaUtils.RuntimeOptions) async throws -> RecalculateCarbonEmissionResponse {
        try TeaUtils.Client.validateModel(request)
        var body: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.code)) {
            body["code"] = request.code ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.year)) {
            body["year"] = request.year ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "headers": headers as! [String: String],
            "body": AlibabaCloudOpenApiUtil.Client.parseToMap(body)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RecalculateCarbonEmission",
            "version": "2022-09-23",
            "protocol": "HTTPS",
            "pathname": "/api/v1/carbon/emission/data/item/recalculate",
            "method": "POST",
            "authType": "AK",
            "style": "ROA",
            "reqBodyType": "json",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RecalculateCarbonEmissionResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func recalculateCarbonEmission(_ request: RecalculateCarbonEmissionRequest) async throws -> RecalculateCarbonEmissionResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        var headers: [String: String] = [:]
        return try await recalculateCarbonEmissionWithOptions(request as! RecalculateCarbonEmissionRequest, headers as! [String: String], runtime as! TeaUtils.RuntimeOptions)
    }
}
