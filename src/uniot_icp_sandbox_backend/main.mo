import RBTree "mo:base/RBTree";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";

actor {
  var scripts : RBTree.RBTree<Text, Text> = RBTree.RBTree(Text.compare);

  public query func wallet_balance() : async Nat {
    let balance = Cycles.balance();
    Debug.print("Cycles Balance: " # debug_show (balance));
    return balance;
  };

  public query func getScriptIds() : async [Text] {
    let arr = Iter.toArray(scripts.entries());
    return Array.map<(Text, Text), Text>(arr, func((id, _)) { id });
  };

  public query func getScript(id : Text) : async Text {
    return switch (scripts.get(id)) {
      case null "";
      case (?Text) Text;
    };
  };

  public func addScript(id : Text, script : Text) : async Text {
    let prevScript : Text = switch (scripts.get(id)) {
      case null "";
      case (?Text) Text;
    };
    scripts.put(id, script);
    return prevScript;
  };
};
