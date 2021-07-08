import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SotfwareComponent } from './sotfware.component';

describe('SotfwareComponent', () => {
  let component: SotfwareComponent;
  let fixture: ComponentFixture<SotfwareComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SotfwareComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SotfwareComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
