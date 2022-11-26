import { ThirdwebSDK } from "@thirdweb-dev/sdk/solana";
import express, { response } from "express";

const app = express();
const private_key = "YOUR_PRIVATE_KEY";
const collection_ID = "YOUR_COLLECTION_ID"
app.use(express.json());

app.get('/claim', async (req, res) => {
    const address = req.query.address;
    const sdk = ThirdwebSDK.fromPrivateKey("devnet", private_key);
    const program = await sdk.getProgram(collection_ID, "nft-drop");

    const claimedAddresses = await program.claimTo(address, 1); 
    var addObj = { "claimedAddresses": claimedAddresses[0] };
    res.send(addObj);
});

app.get('/nft/all', async (req, res) => {
    const sdk = ThirdwebSDK.fromPrivateKey("devnet", private_key);
    const program = await sdk.getProgram(collection_ID, "nft-drop");
    const nfts = await program.getAll();
    res.send(nfts);
});

app.get('/nft', async (req, res) => {
    const address = req.query.address;
    const sdk = ThirdwebSDK.fromPrivateKey("devnet", private_key);
    const program = await sdk.getProgram(collection_ID, "nft-drop");
    const nfts = await program.get(address);
    res.send(nfts);
});

app.listen(3200, () => {
    console.log("Listening on port 3200");
});