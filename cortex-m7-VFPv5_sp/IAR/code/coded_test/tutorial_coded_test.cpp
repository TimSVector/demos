#include <vunit/vunit.h>
#include "cpptypes.h"

namespace {
class managerFixture : public ::vunit::Fixture {
  protected:

    Manager * mgr;

    void SetUp(void) override {
      // Set up code goes here.
      mgr = new Manager();
    }

    void TearDown(void) override {
      delete mgr;
    }
  };
} // namespace

VTEST(managerTests, ExampleTestCase) {
  VASSERT(true);
}

VTEST(managerTests, NothingTest) {
}

VTEST(managerTests, FailingTest) {
  //VASSERT_EQ(2, 1);
}


VTEST_F(managerTests, ExampleFixtureTestCase, managerFixture) {

  // enable stub for Add_Included_Dessert
  // Insert data on stub
  OrderType Order;
  Order.Entree = Steak;
  mgr->PlaceOrder(1, 1, Order);

  // Check stub expected values
  VASSERT_EQ(mgr->GetCheckTotal(1), 14);
}

VTEST_F(managerTests, SteakTest, managerFixture) {
  OrderType Order;
  Order.Entree = Steak;
  mgr->PlaceOrder(1, 1, Order);
  VASSERT_EQ(mgr->GetCheckTotal(1), COST_OF_STEAK);
}

VTEST_F(managerTests, LobsterTest, managerFixture) {
  OrderType Order;
  Order.Entree = Lobster;
  mgr->PlaceOrder(1, 1, Order);
  VASSERT_EQ(mgr->GetCheckTotal(1), COST_OF_LOBSTER);
}

VTEST_F(managerTests, ChickenTest, managerFixture) {
  OrderType Order;
  Order.Entree = Chicken;
  mgr->PlaceOrder(1, 1, Order);
  VASSERT_EQ(mgr->GetCheckTotal(1), COST_OF_CHICKEN);
}

VTEST_F(managerTests, PastaTest, managerFixture) {
  OrderType Order;
  Order.Entree = Pasta;
  mgr->PlaceOrder(1, 1, Order);
  VASSERT_EQ(mgr->GetCheckTotal(1), COST_OF_PASTA);
}