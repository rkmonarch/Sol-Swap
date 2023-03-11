import { FullPublishMetadata, PreDeployMetadataFetched } from "../../schema/contracts/custom";
export type DeployOptions = {
    forceDirectDeploy?: boolean;
};
export type DeployMetadata = {
    compilerMetadata: PreDeployMetadataFetched;
    extendedMetadata?: FullPublishMetadata;
};
//# sourceMappingURL=deploy-options.d.ts.map